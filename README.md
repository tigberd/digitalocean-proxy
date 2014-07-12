# digitalocean-proxy
private digitalocean proxy

## Installation

```
$ vagrant plugin install vagrant-digitalocean
$ cp /path/to/file data_bag_key
$ bundle install
$ vagrant up proxy.phisarts.net --provider=digital_ocean
$ vagrant ssh-config proxy.phisarts.net > vagrant-ssh.conf
$ knife solo bootstrap vagrant@proxy.phisarts.net -F vagrant-ssh.conf
```
