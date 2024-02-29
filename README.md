## KYPO Network traffic analysis excercise utilizing IDPS Suricata and Wireshark
### 🐉 Access from Kali  
- default credentials student:student
- use mozilla 10.10.20.5:80 to access DVWA
- use mozilla 10.10.20.5:5636 to access Evebox
- use mozilla localhost:8080 to access Malicious Flag Checker API
- use ssh monitor@10.10.20.5 to accesss into debi-suri with password monitor

### Sources
* investigate.pcap
https://unit42.paloaltonetworks.com/january-wireshark-quiz-answers/
* suspicious.pcap
https://unit42.paloaltonetworks.com/wireshark-tutorial-dridex-infection-traffic/
* trickbot.pcap
https://academy.hackthebox.com/module/226/section/2451
* ja3_fingerprints.rules
https://sslbl.abuse.ch/blacklist/ja3_fingerprints.rules
* DVWA
https://github.com/digininja/DVWA
* Wireshark plugin
https://github.com/fullylegit/ja3
* Suricata scripts inspired by
https://gist.github.com/jstrosch/d9e31d364a80714856eb70fcf6f9b13f