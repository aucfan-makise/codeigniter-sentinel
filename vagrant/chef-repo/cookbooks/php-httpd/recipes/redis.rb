#
# Cookbook Name:: php-httpd 
# Recipe:: redis
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'redis' do
    action :install
    options "--enablerepo=remi-php#{node.php.version}"
end

service 'redis' do
    action [:enable, :start]
end

package 'php-pecl-redis' do
    options "--enablerepo=remi-php#{node.php.version}"
end
