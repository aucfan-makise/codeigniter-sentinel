#
# Cookbook Name:: mysql
# Recipe:: sentinel
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Create User, DB
execute "mysql-create-user-db" do
    command "/usr/bin/mysql -u root < /tmp/grants.sql"
    action :nothing
end

template "/tmp/grants.sql" do
    owner "root"
    group "root"
    mode "0600"
    variables(
        :user       =>  node['db']['user'],
        :password   =>  node['db']['pass'],
        :database   =>  node['db']['sentinel']['database']
    )
    notifies :run, "execute[mysql-create-user-db]", :immediately
end

#Create tables
execute "sentinel-create-tables" do
    command "/usr/bin/mysql -u root #{node['db']['sentinel']['database']} < /tmp/sentinel.sql"
    action :nothing
end

template "/tmp/sentinel.sql" do
    owner "root"
    group "root"
    mode "0600"
    notifies :run, "execute[sentinel-create-tables]", :immediately
end
