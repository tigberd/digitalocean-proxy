# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.define "local" do |local|
    local.vm.box = "chef/centos-6.5"

    local.vm.network :private_network, ip: "192.168.33.10"

    local.vm.provider :virtualbox do |vb|
      vb.gui = false

      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    end
  end

  config.vm.define "proxy.phisarts.net" do |vps|
    vps.vm.hostname = 'proxy.phisarts.net'

    vps.vm.provider :digital_ocean do |provider, override|
      override.ssh.private_key_path = '~/.ssh/id_rsa'
      override.vm.box               = 'digital_ocean'
      override.vm.box_url           = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

      provider.client_id            = DIGITALOCEAN_CLIENT_ID
      provider.api_key              = DIGITALOCEAN_API_KEY
      provider.ssh_key_name         = DIGITALOCEAN_SSH_KEY_NAME

      provider.image                = 'CentOS 6.5 x64'
      provider.region               = 'San Francisco 1'
      provider.size                 = '512MB'
    end

    vps.vm.provision :shell, :inline => 'echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudoers'
    vps.vm.provision :shell, :inline => 'adduser vagrant'
    vps.vm.provision :shell, :inline => 'usermod -G wheel vagrant'
    vps.vm.provision :shell, :inline => 'cp -r .ssh /home/vagrant/'
    vps.vm.provision :shell, :inline => 'chown vagrant:vagrant /home/vagrant/.ssh/'
  end
end
