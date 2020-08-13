#!/bin/bash

# syscoin conf file
SYSCOIN_CONF=$(cat <<EOF
# rpc config
rpcuser=user
rpcpassword=pass
rpcallowip=127.0.0.1
rpcbind=127.0.0.1
rpcport=8369
# syscoind config
listen=1
server=1
daemon=1
maxconnections=24
EOF
)
 
# required for libdb4.8
sudo apt install -y software-properties-common
echo -ne '\n' | sudo add-apt-repository ppa:bitcoin/bitcoin 
 
# update
sudo apt update -y
 
# build tools
sudo apt install -y git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
 
# boost
sudo apt install -y libboost-all-dev
 
# berkeleydb 4.8
sudo apt install -y libdb4.8-dev libdb4.8++-dev
 
# miniupnpc
sudo apt install -y libminiupnpc-dev
 
# zmq
sudo apt install -y libzmq3-dev
 
# syscoin
git clone https://github.com/syscoin/syscoin.git
cd syscoin
./autogen.sh
./configure
make -j$(nproc) -pipe
sudo make install

# mkdir /.sycoin
mkdir ~/.syscoin
echo "$SYSCOIN_CONF" > ~/syscoin.conf
