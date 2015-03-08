#
# Cookbook Name:: testapp
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/var/www/test" do
     repository "https://github.com/beezd26/TestAPI.git"
     revision "master"
     action :export
end

execute "start forever" do
  command "forever start -w /var/www/test/app.js 4001"
end
