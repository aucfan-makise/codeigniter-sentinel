#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

version = `cat /etc/redhat-release`
    
if version.match(/^CentOS Linux release 7\..*/) then
    required = ['mariadb', 'mariadb-server']
    node.default['db']['type'] = 'mariadb'
    node.default['db']['serviced'] = 'mariadb'
else
    required = ['mysql', 'mysql-server']
    node.default['db']['type'] = 'mysql'
    node.default['db']['serviced'] = 'mysqld'
end

required.each do |name|
  package name do
    action :install
  end
end

service node['db']['serviced'] do
  action [:start, :enable]
end
