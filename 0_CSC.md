```
cd Desktop
git clone https://gitlab.ics.muni.cz/muni-kypo-csc/cyber-sandbox-creator.git
create-sandbox .\cyber-sandbox-creator\topologies\0-routers-1-network-1-host.yml
cd .\cyber-sandbox-creator\topologies\sandbox
manage-sandbox build

# edit Vagrantfile
Vagrant.configure("2") do |config|
  # Device(host): home
  config.vm.boot_timeout = 300000000
```

### SSH into machine
```
vagrant global-status
vagrant ssh 13759ff

ssh -p 2222 -L 127.0.0.1:8080:127.0.0.1:5636 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -o IdentitiesOnly=yes -i ~/.vagrant.d/insecure_private_key vagrant@127.0.0.1
manage-sandbox destroy
```