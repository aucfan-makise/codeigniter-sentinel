#
# Cookbook Name:: php-mysql-httpd
# Recipe:: httpd
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "httpd" do
  action :install
end

template "/etc/httpd/conf.d/codeigniter.conf" do
    source "codeigniter.conf.erb"
end

service "httpd" do
  action [:start, :enable]
end
