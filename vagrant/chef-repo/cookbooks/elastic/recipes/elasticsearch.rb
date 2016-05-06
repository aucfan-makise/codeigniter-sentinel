#
# Cookbook Name:: elastic
# Recipe:: elasticsearch
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

package "java-1.8.0-openjdk" do
  action :install
end

bash "install elasticsearch" do
    flags '-ex'
    code <<-EOH
    cd /root
    wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.2.0/elasticsearch-2.2.0.rpm
    rpm -Uvh elasticsearch-2.2.0.rpm
    EOH
    not_if 'rpm -qa | grep -q elasticsearch'
end

service 'elasticsearch' do
    action [:enable, :start]
end
