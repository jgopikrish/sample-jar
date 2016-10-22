#
# Cookbook Name:: devops-challenge
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node['platform_family']
when 'rhel'
    include_recipe "java::default"
    include_recipe "devops-challenge::_tomcat"
    include_recipe "devops-challenge::_deploy"
  else
    Chef::Log.error 'This Cookbook supports for centos'
  return
end
