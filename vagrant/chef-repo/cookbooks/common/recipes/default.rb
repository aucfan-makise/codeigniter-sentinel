#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

package "epel-release" do
    action :install
end

package "git" do
    action :install
end

package "zip" do
    action :install
end

package "unzip" do
    action :install
end
