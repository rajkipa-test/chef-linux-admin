#!/usr/bin/env python
import requests
import json
import os
import sys
import argparse
import re
from datetime import datetime, timedelta
from random import randint
import getpass

requests.packages.urllib3.disable_warnings() 
main_url = 'https://localhost/pulp/api/v2/'

def __list_repo__( cred, prefix ):
    url=main_url + 'repositories/search/'
    payload={"criteria": {"fields": ["id"], "filters": {"$and": [{"notes._repo-type": "rpm-repo"}, {"id": {"$regex": '^'+prefix}}]}}}
    response = requests.post(url, json.dumps(payload), auth=cred, verify=False)
    return([repo['id'] for repo in response.json() ])

def __create_repo__( cred, repo ):
    url=main_url + 'repositories/'
    payload = {"display_name": None, "description": None, "distributors": [{"distributor_id": "yum_distributor", "auto_publish": True, "distributor_config": {"http": True, "relative_url": repo, "https": True}, "distributor_type_id": "yum_distributor"}, {"distributor_id": "export_distributor", "auto_publish": False, "distributor_config": {"http": False, "relative_url": repo, "https": True}, "distributor_type_id": "export_distributor"}], "notes":{"_repo-type": "rpm-repo"}, "importer_type_id": "yum_importer", "importer_config": {}, "id": repo}
    response = requests.post(url, json.dumps(payload), auth=cred, verify=False)
    return(response)

def sync( cred, schedules ):
    repolist = __list_repo__( cred, 'base' )
    for repo in repolist:
        url = '{}repositories/{}/importers/yum_importer/schedules/sync/'.format(main_url,repo)
        if schedules in [ 'list', 'delete' ] :
            response = requests.get(url, auth=cred, verify=False )
            if response.ok:
                datadump = response.json()
                if datadump:
                    for data in datadump:
                        if schedules == 'list':
                            print(data['_id'], data['enabled'], data['schedule'], data['next_run'], data['last_run_at'], data['args'][0])
                        else:
                            print("Deleting rpm repo {}".format(data['args'][0])
                            delurl = url + data['_id'] + '/'
                            response = requests.delete(delurl, auth=cred, verify=False)
                            print(response)
            else:
                print("Can't get schedule of {}".format(repo))
        elif schedules in [ 'run', 'now' ]:
            if schedules == 'now':
                hrdelta = 0
                mindelta = 0
            else:
                hrdelta = randint(1,24)
                mindelta = randint(1,60)
            schedule_time = (datetime.utcnow() + timedelta(hours=hrdelta, minutes=mindelta)).isoformat()+'Z/P1D'
            payload = {"override_config": {}, "schedule": schedule_time, "enabled": True, "failure_threshold": 5}
            response = requests.post(url, json.dumps(payload), auth=cred, verify=False )
            print(response)
            print(repo,schedule_time)

def cv( cred, schedules ):
    curtime = datetime.utcnow()
    curday = curtime.date()
    if schedules == 'run':
        curday = curday.replace(day=01)  # It replaces the date to 1st of current month
    prefix = curday.isoformat()
    print(prefix)
    base_repolist = __list_repo__( cred, 'base' )
    repolist = [ repo.split('_',1)[-1] for repo in base_repolist]
    for repo in repolist:
        new_repo = prefix + '_' + repo
        response = __create_repo__( cred, new_repo )
        if response.status_code == 201:
            print('Rpm repo {} successfully created'.format(new_repo))
        elif response.status_code == 409:
            print('RPM repo {} already exists'.format(new_repo))
        elif response.status_code == 500:
            print('importer or distributor raised error for repo {}'.format(new_repo))
        elif response.status_code == 400:
            print('one or more parameter is invalid for repo {}'.format(new_repo))


def main():
    parser = argparse.ArgumentParser(description='pulp-manage')
    parent_parser = argparse.ArgumentParser(add_help=False)
    parent_parser.add_argument('-u', '--user', dest='user', help='user to auth to pulp server')
    parent_parser.add_argument('-p', '--password', dest='password', help='password')
    parent_parser.add_argument('-n', '--nodename', default='localhost', help='pulp server hostname (default: localhost)')

    subparsers = parser.add_subparsers(title='actions')

    # subparser for create function
    parser_cv = subparsers.add_parser('cv', parents=[parent_parser], help='To create content view', formatter_class=argparse.RawTextHelpFormatter)
    parser_cv.add_argument('-c', '--create', dest='schedules', default='run', choices=[ 'run', 'now' ], required=True, help='''
        create content view
        run = create content view for 1st of current month
        now = create content view for current date and time
        ''')
    parser_cv.set_defaults(func=cv)

    # subparser for sync function
    parser_sync = subparsers.add_parser('sync', parents=[parent_parser], formatter_class=argparse.RawTextHelpFormatter, help='To sync base yum repo' )
    parser_sync.add_argument('-s', '--schedules', default='run', choices=[ 'list', 'run', 'now', 'delete' ], required=True, help='''
        list = list scheduled syncs of all repos
        run = create sync schedule for all repos
        now = sync all repos immediately
        delete = delete all schedules
        (default: run)
        ''')
    parser_sync.set_defaults(func=sync)
    
    # storing parser output in namespace
    args = parser.parse_args()

    # Ask user to enter password if not passed through command line
    if args.password == None:
        args.password = getpass.getpass()

    cred = (args.user,args.password)

    # checking command line parameters
    if len(sys.argv) < 2:
        parser.print_usage()
        sys.exit()
 
    # Calling the appropriate function
    args.func(cred, args.schedules)

 

if __name__ == '__main__':
    main()

