#
# Cookbook Name:: proxy
# Recipe:: default
#

Array(node.proxy.install_pkgs).each do |pkg|
  package pkg
end

cookbook_file "#{node.proxy.config_file}" do
  path "#{node.proxy.config_dir}/#{node.proxy.config_file}"
  notifies :restart, "service[squid]"
end

template "#{node.proxy.config_dir}/#{node.proxy.htpasswd_script_template}" do
  source "#{node.proxy.htpasswd_script_template}"
  mode 0755
  variables(
    :user => "#{node.proxy.user}",
    :pass => "#{node.proxy.pass}"
  )
end

bash "Create htpasswd" do
  code "#{node.proxy.config_dir}/#{node.proxy.htpasswd_script_template}"
end

service "squid"
