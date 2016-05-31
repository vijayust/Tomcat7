#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "copy" do
  cwd "/usr/local"
  command "wget http://203.99.43.240:8080/FogPanel/fog_dependencies/apache-tomcat-7.0.67.tar.gz"
end

execute "tar" do
  cwd "/usr/local"
  command "tar xvf apache-tomcat-7.0.67.tar.gz"
  action :run
end

execute "move" do
  cwd "/usr/local"
  command "mv apache-tomcat-7.0.67 tomcat"
end

catalina_home="export CATALINA_HOME=/usr/local/tomcat"
path = "export PATH=$PATH:CATALINA_HOME"

file "/root/.bashrc" do
  content "#{catalina_home}\n#{path}"
  owner "root"
end

execute "copy" do
  cwd "/usr/local/tomcat/lib"
  command "wget http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.38/mysql-connector-java-5.1.38.jar"
end
