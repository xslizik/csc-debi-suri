### 🚀 Initial Setup
```bash
create-sandbox .\csc-debi-suri.yml
cd .\sandbox
```
### 📦 Don't Forget to Add Custom Vagrantfile and Provisioning
```bash
manage-sandbox build
```

### 🔑 SSH into Machines
#### debi-suri
```bash
ssh -p 2222 -L 127.0.0.1:8080:127.0.0.1:5636 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -o IdentitiesOnly=yes -i ~/.vagrant.d/insecure_private_key vagrant@127.0.0.1
```
#### debi
```bash
ssh -p 2200 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR -o IdentitiesOnly=yes -i ~/.vagrant.d/insecure_private_key vagrant@127.0.0.1
```

### 🏃‍♂️ Run Modes
```bash
suricata -c /usr/local/var/lib/suricata/suricata.yaml -k none -l /tmp/suricata/
./evebox_pcap.sh 2023-01-Unit42-Wireshark-quiz.pcap
```

### 🧹 Cleanup
```bash
manage-sandbox destroy
```

### 🐛 For Debug Use 
```bash
vagrant up
vagrant provisioning
vagrant reload
vagrant destroy
```

### 🛠️ Made for Cyber Sandbox Creator
```
https://gitlab.ics.muni.cz/muni-kypo-csc/cyber-sandbox-creator
```