### 🚀 Initial Setup
#### To get started quickly, you can utilize the provided build script for an easy sandbox setup.
#### If the boot time exceeds the limit on your machine, adjust the timeout in the Vagrant file:
```bash
device.vm.boot_timeout = 99999
```

### 🐉 Kali  
- use 10.10.20.5:80 to access DVWA
- use 10.10.20.5:5636 to access evebox

### 🔑 SSH into Debi Suri
### From Kali
```bash
ssh vagrant@10.10.20.5 
```

### From your machine
```bash
ssh -p 2200 -L 127.0.0.1:5636:10.10.20.5:5636 -L 127.0.0.1:80:10.10.20.5:80 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -o IdentitiesOnly=yes -i ~/.vagrant.d/insecure_private_key vagrant@127.0.0.1
```

### 🏃‍♂️ Suricata Run Modes
### PCAP inspection
```bash
/home/vagrant/pcap_suri.sh capture.pcap
```

### Live Capture
```bash
/home/vagrant/live_suri.sh
evebox server -v -D /etc/suricata/live_db --datastore sqlite --input /etc/suricata/log/eve.json --host 10.10.20.5
```

### 🧹 Cleanup
```bash
manage-sandbox destroy
```

### 🐛 Reset in case of error with 
```bash
vagrant destroy
```

### 🛠️ Made for Cyber Sandbox Creator
```
https://gitlab.ics.muni.cz/muni-kypo-csc/cyber-sandbox-creator
```

### 🔒 Vulnerable box used from
```
https://github.com/digininja/DVWA
```
