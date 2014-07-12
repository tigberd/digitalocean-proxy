default[:proxy][:user] = "vagrant"
default[:proxy][:pass] = "vagrant"

default[:proxy][:config_dir] = "/etc/squid"
default[:proxy][:config_file] = "squid.conf"
default[:proxy][:htpasswd_script_template] = "htpasswd.exp.erb"

default[:proxy][:install_pkgs] = %w{ squid httpd expect }
