template '/etc/login.defs' do
  source 'logindefs.erb'
  mode '644'
  owner 'root'
  group 'root'
  variables({
    :umask => node[:unsafe_umask][:umask][:unsafe],
    :usergroups => node[:unsafe_umask][:usergroups][:unsafe]
  })
end
