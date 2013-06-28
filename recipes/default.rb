#
# Cookbook Name:: unsafe_umask
# Recipe:: default
#
# Copyright (c) 2012-2013, Rapid7
#
# All Rights Reserved - Do Not Redistribute
#

# NOTE: This is a work around for http://tickets.opscode.com/browse/CHEF-3304
Encoding.default_external = Encoding::UTF_8 if RUBY_VERSION > '1.9'

template '/etc/login.defs' do
  mode '644'
  owner 'root'
  group 'root'
  variables({
    :umask => node[:unsafe_umask][:umask],
    :user_groups => node[:unsafe_umask][:user_groups]
  })
end
