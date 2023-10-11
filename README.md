### 🚀 Initial Setup
```bash
git clone https://gitlab.ics.muni.cz/muni-kypo-csc/cyber-sandbox-creator.git
create-sandbox .\cyber-sandbox-creator\topologies\0-routers-1-network-1-host.yml
cd .\cyber-sandbox-creator\topologies\sandbox
```
### 📦 Don't Forget to Add Custom Vagrantfile and Provisioning
```bash
manage-sandbox build
vagrant up

# rebuild using
vagrant provisioning
vagrant reload
```

### 🔑 SSH into Machine
```bash
# ssh from anywhere
vagrant global-status
vagrant ssh 13759ff

# ssh from the directory
vagrant ssh 

# ssh using portforwarding
ssh -p 2222 -L 127.0.0.1:8080:127.0.0.1:5636 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -o IdentitiesOnly=yes -i ~/.vagrant.d/insecure_private_key vagrant@127.0.0.1
```
### 🏃‍♂️ Run Modes

```bash
# run suricata on a network interface
suricata -c /usr/local/var/lib/suricata/suricata.yaml -k none -l /tmp/suricata/ --runmode=autofp -i enp0s3

# run suricata in pcap mode
./evebox_pcap.sh 2023-01-Unit42-Wireshark-quiz.pcap
```

### 🧹 Cleanup
```bash
manage-sandbox destroy
vagrant destroy
```