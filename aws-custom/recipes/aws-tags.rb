#
# Cookbook Name:: aws-custom
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "aws"

unless node['aws-tag']['tags'].empty? || node['aws-tag']['tags'].nil?
    aws_resource_tag node['ec2']['instance_id'] do
        tags(node['aws-tag']['tags'])
        action :update
    end
end
