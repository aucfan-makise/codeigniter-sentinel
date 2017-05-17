#
# Cookbook Name:: php-httpd
# Recipe:: memcached
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'memcached' do
    options "--enablerepo=remi-php#{node.php.version}"
end

service 'memcached' do
    action [:enable, :start]
end

package 'php-pecl-memcached' do
    options "--enablerepo=remi-php#{node.php.version}"
end
