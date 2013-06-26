# Hack. http://tickets.opscode.com/browse/CHEF-3304
Encoding.default_external = Encoding::UTF_8 if RUBY_VERSION > '1.9'

template '/etc/login.defs' do
  source 'logindefs.erb'
  mode '644'
  owner 'root'
  group 'root'
  variables({
    :umask => node[:unsafe_umask][:umask][:safe],
    :usergroups => node[:unsafe_umask][:usergroups][:safe]
  })
end
