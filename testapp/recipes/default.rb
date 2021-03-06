#
# Cookbook Name:: testapp
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'dependencies'


node[:deploy].each do |application, deploy|
  if application == "app_1_prod"
    Chef::Log.debug("DEPLOYING THE TEST!!!!!!")
    git "/var/www/test/" do
         repository "https://github.com/beezd26/TestAPI.git"
         revision "master"
         action :sync
    end
    execute "start forever" do
      user "ec2-user"
      cwd "/var/www/test"
      command "forever stopall --uid 'prod'"
      command "forever start -w --uid 'prod' -a -p /home/ec2-user/.forever app.js 8001"
    end
    next
  end
  if application == "app_1_stage"
    Chef::Log.debug("DEPLOYING THE TEST!!!!!!")
    git "/var/www/test/stage/" do
         repository "https://github.com/beezd26/TestAPI.git"
         revision "master"
         action :sync
    end
    execute "start forever" do
      user "ec2-user"
      cwd "/var/www/test/stage"
      command "forever stopall --uid 'stage'"
      command "forever start -w --uid 'stage' -a -p /home/ec2-user/.forever app.js 8005"
    end
    next
  end
end
