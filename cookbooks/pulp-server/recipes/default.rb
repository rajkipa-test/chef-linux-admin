#
# Cookbook:: pulp-server
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe "pulp-server::package"
include_recipe "pulp-server::service"
include_recipe "pulp-server::create_repo"
