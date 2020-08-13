#!/bin/bash
 
# required for libdb4.8
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:bitcoin/bitcoin
 
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
