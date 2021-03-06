#if node[fqdn] =~ /pmir/ do
#end
default['pulp-server']['pulp_yum_repo']['centos-6-os']['feed'] = 'http://mirror.centos.org/centos/6/os/x86_64/'
default['pulp-server']['pulp_yum_repo']['centos-6-extras']['feed'] = 'http://mirror.centos.org/centos/6/extras/x86_64/'
default['pulp-server']['pulp_yum_repo']['centos-6-updates']['feed'] = 'http://mirror.centos.org/centos/6/updates/x86_64/'
default['pulp-server']['pulp_yum_repo']['centos-7-os']['feed'] = 'http://mirror.centos.org/centos/7/os/x86_64/'
default['pulp-server']['pulp_yum_repo']['centos-7-extras']['feed'] = 'http://mirror.centos.org/centos/7/extras/x86_64/'
default['pulp-server']['pulp_yum_repo']['centos-7-updates']['feed'] = 'http://mirror.centos.org/centos/7/updates/x86_64/'
default['pulp-server']['pulp_yum_repo']['epel-6']['feed'] = 'http://dl.fedoraproject.org/pub/epel/6/x86_64/'
default['pulp-server']['pulp_yum_repo']['epel-7']['feed'] = 'http://dl.fedoraproject.org/pub/epel/7/x86_64/'
default['pulp-server']['pulp_yum_repo']['sfmc_extras']
default['pulp-server']['pulp_yum_repo']['sfmc-extras-el6']
default['pulp-server']['pulp_yum_repo']['sfmc-extras-el7']
default['pulp-server']['pulp_yum_repo']['artifactory']['feed'] = 'https://jfrog.bintray.com/artifactory-pro-rpms/'
default['pulp-server']['pulp_yum_repo']['el6-collectd']['feed'] = 'https://pkg.ci.collectd.org/rpm/master/epel-6-x86_64/'
default['pulp-server']['pulp_yum_repo']['el7-collectd']['feed'] = 'https://pkg.ci.collectd.org/rpm/master/epel-7-x86_64/'
default['pulp-server']['pulp_yum_repo']['el6-cloudera-cdh-5.1.2']['feed'] = 'http://archive.cloudera.com/cm5/redhat/6/x86_64/cm/5.1.2/'
default['pulp-server']['pulp_yum_repo']['el6-cloudera-manager-5.1.5']['feed'] = 'http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/5.1.5/'
default['pulp-server']['pulp_yum_repo']['el7-cloudera-cdh-5.5']['feed'] = 'https://archive.cloudera.com/cdh5/redhat/7/x86_64/cdh/5.5/'
default['pulp-server']['pulp_yum_repo']['el7-cloudera-manager-5.5.1']['feed'] = 'https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/5.5.1/'
default['pulp-server']['pulp_yum_repo']['el7-cloudera-manager-5.8.1']['feed'] = 'https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/5.8.1/'
default['pulp-server']['pulp_yum_repo']['el7-cloudera-manager-5.8.2']['feed'] = 'https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/5.8.2/'
default['pulp-server']['pulp_yum_repo']['confluent-base-3.1']['feed'] = 'http://packages.confluent.io/rpm/3.1'
default['pulp-server']['pulp_yum_repo']['confluent-base-3.2']['feed'] = 'http://packages.confluent.io/rpm/3.2'
default['pulp-server']['pulp_yum_repo']['confluent-dist-3.1']['feed'] = 'http://packages.confluent.io/rpm/3.1/7'
default['pulp-server']['pulp_yum_repo']['confluent-dist-3.1']['relative-url'] = 'http://packages.confluent.io/rpm/3.1/7'
default['pulp-server']['pulp_yum_repo']['confluent-dist-3.2']['feed'] = 'http://packages.confluent.io/rpm/3_2/7'
default['pulp-server']['pulp_yum_repo']['confluent-dist-3.2']['relative-url'] = 'http://packages.confluent.io/rpm/3_2/7'
default['pulp-server']['pulp_yum_repo']['elasticsearch-5x']['feed'] = 'https://artifacts.elastic.co/packages/5.x/yum'
default['pulp-server']['pulp_yum_repo']['elasticsearch-6x']['feed'] = 'https://artifacts.elastic.co/packages/6.x/yum'
default['pulp-server']['pulp_yum_repo']['el6-hputils']['feed'] = 'http://downloads.linux.hpe.com/SDR/repo/spp/rhel/6Server/x86_64/current'
default['pulp-server']['pulp_yum_repo']['el7-hputils']['feed'] = 'http://downloads.linux.hpe.com/SDR/repo/spp/rhel/7Server/x86_64/current'
default['pulp-server']['pulp_yum_repo']['el6-icinga2']['feed'] = 'https://packages.icinga.com/epel/6/release/'
default['pulp-server']['pulp_yum_repo']['el7-icinga2']['feed'] = 'https://packages.icinga.com/epel/7/release/'
default['pulp-server']['pulp_yum_repo']['el7-influxdata']['feed'] = 'https://repos.influxdata.com/centos//7/x86_64/stable/'
default['pulp-server']['pulp_yum_repo']['el6-shibboleth']['feed'] = 'http://download.opensuse.org/repositories/security:/shibboleth/CentOS_CentOS-6/'
default['pulp-server']['pulp_yum_repo']['el7-shibboleth']['feed'] = 'http://download.opensuse.org/repositories/security:/shibboleth/CentOS_7/'
default['pulp-server']['pulp_yum_repo']['el7-percona-x86_64']['feed'] = 'http://repo.percona.com/release/centos/7/RPMS/x86_64/'
default['pulp-server']['pulp_yum_repo']['el7-percona-noarch']['feed'] = 'http://repo.percona.com/release/centos/7/RPMS/noarch/'
default['pulp-server']['pulp_yum_repo']['el6-nodejs-7']['feed'] = 'http://rpm.nodesource.com/pub_7.x/el/6/x86_64/'
default['pulp-server']['pulp_yum_repo']['el7-nodejs-7']['feed'] = 'http://rpm.nodesource.com/pub_7.x/el/7/x86_64/'
default['pulp-server']['pulp_yum_repo']['el7-nodejs-10']['feed'] = 'https://rpm.nodesource.com/pub_10.x/el/7/x86_64/'
default['pulp-server']['pulp_yum_repo']['jenkins']['feed'] = 'http://172.20.83.2/repos/Jenkins/Jenkins/'
default['pulp-server']['pulp_yum_repo']['el7-sclo-3.4']['feed'] = 'http://mirror.centos.org/centos/7/sclo/x86_64/sclo/'
default['pulp-server']['pulp_yum_repo']['el7-sclo-rh-3.4']['feed'] = 'http://mirror.centos.org/centos/7/sclo/x86_64/rh/'
default['pulp-server']['pulp_yum_repo']['zulu']
