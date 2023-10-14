### 🚀 Initial Setup
```bash
create-sandbox .\csc-debi-suri.yml
cd .\sandbox
```
### 📦 Don't Forget to Add Custom Provisioning
```bash
manage-sandbox build -vvv
```

### 🐉 Kali  
- use 10.10.30.5:80 to access DVWA
- use 10.10.30.5:5636 to access evebox

### 🔑 SSH into Debi Suri
### From Kali
```bash
ssh vagrant@10.10.30.5 
```

### From your machine
```bash
ssh -p 2222 -L 127.0.0.1:8080:10.10.30.5:5636 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -o IdentitiesOnly=yes -i ~/.vagrant.d/insecure_private_key vagrant@127.0.0.1
```

### 🏃‍♂️ Run Modes
### PCAP inspection
```bash
/home/vagrant/evebox_pcap.sh 2023-01-Unit42-Wireshark-quiz.pcap
```

### Live Capture
```bash
sudo suricata -c /usr/local/var/lib/suricata/suricata.yaml -k all -l /tmp/suricata/ -i enp0s8
evebox server -v -D /home/vagrant/live_db --datastore sqlite --input /tmp/suricata/eve.json --host 10.10.30.5
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
