#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
source "$HOME/.cargo/env"
rustup default stable
rustup update
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> -a /etc/profile
export PATH="$HOME/.cargo/bin:$PATH"

cd /opt/suricata-7.0.1
./configure --enable-nfqueue --sysconfdir=/etc --enable-unix-socket 
make 
make install
ldconfig