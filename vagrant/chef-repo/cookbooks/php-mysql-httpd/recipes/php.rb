#
# Cookbook Name:: php-mysql-httpd
# Recipe:: php
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute "Install remi repository" do
  command "cat /etc/redhat-release | awk " + '\'BEGIN{FS="[.[:space:]]"}{print $4}\'' + " | xargs -I % rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-%.rpm"
  not_if "rpm -qa | grep -q 'remi-release'"
end

%w{php php-mbstring php-pdo php-mysqlnd php-xml php-devel php-pecl-xdebug}.each do |name|
  package name do
    action :install
    options "--enablerepo=remi-php#{node.php.version}"
  end

template "/etc/php.d/php.local.ini" do
  source "php.local.ini.erb"
  owner "vagrant"
  group "vagrant"
end

template "/etc/php.d/15-xdebug.ini" do
    source "xdebug.ini.erb"
    owner 'root'
    group 'root'
    mode 644
end
end
