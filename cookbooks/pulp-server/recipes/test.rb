cookbook_file '/usr/local/sbin/pulp-manage.py' do
  source 'pulp-manage.py'
  owner 'root'
  group 'root'
  mode 0755
end

