#
# Cookbook:: pulp-server
# Recipe:: service
#
# Copyright:: 2018, The Authors, All Rights Reserved.

service 'mongod' do
  action [:start, :enable]
end

service 'qpidd' do
  action [:start, :enable]
end

# Generate key pair
execute 'pulp_gen_keypair' do
  command 'pulp-gen-key-pair; pulp-gen-ca-certificate'
end

# Start mongodb 
execute 'start_mongodb' do
  command 'sudo -u apache pulp-manage-db && touch /var/chef/mongodb.installed; sleep 60'
  not_if 'ls /var/chef |grep mongodb.installed'
end

cookbook_file '/etc/pulp/admin/conf.d/custom_admin.conf' do
  source 'custom_admin.conf'
  owner 'root'
  group 'root'
  mode 0644
end

directory '/root/.pulp' do
  owner 'root'
  group 'root'
  mode 0700
end

cookbook_file '/root/.pulp/admin.conf' do
  source 'local_admin.conf'
  owner 'root'
  group 'root'
  mode 0400
end

cookbook_file '/usr/local/sbin/pulp-service' do
  source 'pulp-service'
  owner 'root'
  group 'root'
  mode 0754
end


service 'httpd' do
  action [:start, :enable]
end

service 'pulp_workers' do
  action [:start, :enable]
end

service 'pulp_celerybeat' do
  action [:start, :enable]
end

service 'pulp_resource_manager' do
  action [:start, :enable]
end


