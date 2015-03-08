#
# Cookbook Name:: testapp
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'dependencies'

if node[:deploy]['appshortname'][:application] =="app_1_prod"
  Chef::Log.debug("DEPLOYING THE TEST!!!!!!")
  git "/var/www/test" do
       repository "https://github.com/beezd26/TestAPI.git"
       revision "master"
       action :export
  end
  execute "start forever" do
    command "forever start -w /var/www/test/app.js 4001"
  end
  next
end
else
  Chef::Log.debug("WHAT IS THIS!!!!!!!!")
end
