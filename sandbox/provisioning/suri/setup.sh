#!/bin/bash
sudo su
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
source "$HOME/.cargo/env"
rustup default stable
rustup update
echo 'export PATH="$HOME/.cargo/bin:$PATH"' | sudo tee -a /etc/profile
export PATH="$HOME/.cargo/bin:$PATH"

cd /home/vagrant/suricata-7.0.1
./configure && make && make install
ldconfig
suricata-update update-sources
suricata-update enable-source et/open
