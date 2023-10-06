#!/usr/bin/bash

apt-get update
apt-get install --yes software-properties-common jq wget gnupg apt-transport-https unzip
wget -qO - https://evebox.org/files/GPG-KEY-evebox > /etc/apt/trusted.gpg.d/evebox.asc
echo "deb http://evebox.org/files/debian stable main" > /etc/apt/sources.list.d/evebox.list
apt install -y libpcre2-dev
apt-get install -y libyaml-dev
apt install -y libjansson-dev
apt-get install -y libpcap-dev
apt-get install -y gawk
apt-get install -y libunwind-dev
apt-get install -y libmagic-dev
apt-get install -y liblz4-dev
apt-get install -y libcap-ng-dev
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
source "$HOME/.cargo/env"
rustup default stable
rustup update
apt-get update && apt-get -y upgrade
wget https://www.openinfosecfoundation.org/download/suricata-7.0.1.tar.gz
tar xzvf suricata-7.0.1.tar.gz && rm suricata-7.0.1.tar.gz
cd suricata-7.0.1
./configure
make
make install
apt-get update && apt-get -y upgrade
apt-get install -y evebox 
ldconfig

cd ..

suricata-update update-sources
suricata-update enable-source et/open
suricata-update
suricata-update list-sources --enabled

## wget suricata.yaml
wget https://github.com/xslizik/csc-debi-suri/blob/main/wget/suricata.yaml
cp suricata.yaml /usr/local/var/lib/suricata/suricata.yaml && rm suricata.yaml

## wget classification.config
wget https://github.com/xslizik/csc-debi-suri/blob/main/wget/classification.config
cp classification.config /usr/local/var/lib/suricata/classification.config && rm classification.config

## wget reference.config
wget https://github.com/xslizik/csc-debi-suri/blob/main/wget/reference.config
cp reference.config /usr/local/var/lib/suricata/reference.config && rm reference.config

## wget evebox_pcap.sh
wget https://github.com/xslizik/csc-debi-suri/blob/main/evebox_pcap.sh

## wget pcaps
wget https://github.com/pan-unit42/Wireshark-quizzes/raw/main/2023-01-Unit42-Wireshark-quiz.pcap.zip
unzip -P infected 2023-01-Unit42-Wireshark-quiz.pcap.zip && rm 2023-01-Unit42-Wireshark-quiz.pcap.zip