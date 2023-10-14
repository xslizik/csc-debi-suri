### 🚀 Initial Setup
```bash
create-sandbox .\csc-debi-suri.yml
cd .\sandbox
```
### 📦 Don't Forget to Add Custom Provisioning
```bash
manage-sandbox build -vvv
```

### 🔑 SSH into Debi Suri
```bash
ssh -p 2222 -L 127.0.0.1:8080:127.0.0.1:5636 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -o IdentitiesOnly=yes -i ~/.vagrant.d/insecure_private_key vagrant@127.0.0.1
```
### 🐉 To access DVWA on Kali use browser 10.10.30.5

### 🏃‍♂️ Run Modes
### PCAP inspection
```bash
/home/vagrant/evebox_pcap.sh 2023-01-Unit42-Wireshark-quiz.pcap
```

### Live Capture
```bash
suricata -c /usr/local/var/lib/suricata/suricata.yaml -k all -l /tmp/suricata/
evebox server -v -D /home/vagrant/evebox_db --datastore sqlite --input /tmp/suricata/eve.json
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