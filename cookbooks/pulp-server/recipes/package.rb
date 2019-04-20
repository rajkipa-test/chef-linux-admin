#
# Cookbook:: pulp-server
# Recipe:: package
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute "install-epel" do
  command "yum install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y"
  not_if "rpm -qa |grep -i epel"
end

execute 'setup pulp repo' do
  command "wget -P /etc/yum.repos.d http://repos.fedorapeople.org/repos/pulp/pulp/rhel-pulp.repo
  "
  not_if "ls -l /etc/yum.repos.d |grep rhel-pulp"
end

%w(
  mongodb-server
  qpid-cpp-server
  qpid-cpp-server-linearstore
  pulp-server
  python-gofer-qpid
  python2-qpid qpid-tools
  pulp-rpm-plugins
  pulp-puppet-plugins
  pulp-docker-plugins
  pulp-admin-client
  pulp-rpm-admin-extensions
  pulp-puppet-admin-extensions
  pulp-docker-admin-extensions
).each do |pkg|
  package pkg
end
