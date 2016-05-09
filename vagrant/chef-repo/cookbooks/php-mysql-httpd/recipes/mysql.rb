#
# Cookbook Name:: php-mysql-httpd
# Recipe:: mysql
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

version = `cat /etc/redhat-release`
    
if version.match(/^CentOS Linux release 7\..*/) then
    required = ['mariadb', 'mariadb-server']
    serviced = 'mariadb'
else
    required = ['mysql', 'mysql-server']
    serviced = 'mysqld'
end

required.each do |name|
  package name do
    action :install
  end
end

service serviced do
  action [:start, :enable]
end
