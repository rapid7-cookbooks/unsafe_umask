#
# Cookbook Name:: unsafe_umask
# Attributes:: default
#
# Copyright (c) 2012-2013, Rapid7
#
# All Rights Reserved - Do Not Redistribute
#

default[:unsafe_umask][:safe] = true
default[:unsafe_umask][:umask] = node[:unsafe_umask][:safe] ? '077' : '022'
default[:unsafe_umask][:user_groups] = node[:unsafe_umask][:safe] ? 'no' : 'yes'
