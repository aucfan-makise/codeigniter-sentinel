#
# Cookbook Name:: elastic
# Recipe:: kibana
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

bash "install kibana" do
    flags '-ex'
    code <<-EOH
    cd /root
    wget https://download.elastic.co/kibana/kibana/kibana-4.4.0-linux-x64.tar.gz
    tar zxvf kibana-4.4.0-linux-x64.tar.gz
    mv kibana-4.4.0-linux-x64 /usr/local/etc
    EOH
    not_if 'ls /usr/local/etc | grep -q kibana-4.4.0-linux-x64'
end

template "/etc/init.d/kibana" do
    source "kibana.erb"
    owner 'root'
    group 'root'
    mode 0755
end

service 'kibana' do
    action [:enable, :start]
end
