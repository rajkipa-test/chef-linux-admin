#
# Cookbook:: pulp-server
# Recipe:: create_repo
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node['pulp-server']['pulp_yum_repo'].each do |repo_id, pulp_opts|
  fields = ''
  pulp_opts.each do |key, value|
    fields  = "#{fields}" + "--#{key}=#{value} "
  end
  execute "create rpm repo #{repo_id}" do
    command "pulp-admin rpm repo create --serve-http=true #{fields} --repo-id \"base_#{repo_id}\" "
    not_if "pulp-admin rpm repo list --repo-id \"base_#{repo_id}\" "
  end
end
