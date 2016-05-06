#
# Cookbook Name:: php-mysql-httpd
# Recipe:: mysql
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

command = "cat /etc/redhat-release | awk " + '\'BEGIN{FS="[.[:space:]]"}{print $4}\''
version = `command`
p version
    
if to_i(version) >= 7 then
    required = ['mariadb', 'mariadb-server']
else
    required = ['mysql', 'mysql-server']
end

required.each do |name|
  package name do
    action :install
  end
end

service "mysqld" do
  action [:start, :enable]
end
