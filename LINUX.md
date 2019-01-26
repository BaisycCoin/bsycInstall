# Linux VPS BSYCUM Daemon Installation Guide

## Connect to your Linux VPS over SSH

  * Use your favorite terminal application on Linux or Putty/Bitvise clients on Windows
  * Connect to a terminal session with the Linux VPS
  
## Update your system to the latest

  * From the terminal session, run the following commands
  ```
  sudo apt-get update
  sudo apt-get upgrade
  ```
  
## Download the BSYCUM Linux Daemon

  * From the terminal session, run the following command
  ```
  wget https://github.com/bsycum-network/bsyc/releases/download/v3.1.0.0/bsyc-3.1.0-linux.tar.gz
  ```
  * From the terminal session, run the following command
  ```
  tar -xvf bsyc-3.1.0-linux.tar.gz
  ```
  
## Install BSYCUM Linux Daemon Runtime Dependencies

  * From the terminal session, run the following commands
  ```
  sudo apt autoremove -y && sudo apt-get update
  sudo apt-get install -y libzmq3-dev libminiupnpc-dev libssl-dev libevent-dev
  sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config
  sudo apt-get install -y bsdmainutils software-properties-common
  sudo apt-get install -y libboost-all-dev
  sudo add-apt-repository ppa:bitcoin/bitcoin -y
  sudo apt-get update
  sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
  ```
  
## Create your BSYCUM Linux Daemon configuration file

* From the terminal session, run the following commands
```
mkdir -p ~/.bsyc
nano ~/.bsyc/bsyc.conf
```

* Now add the following lines to this file, replacing any < > field with your information
  * Note: If your setting up a Linux Hot/Cold Wallet, comment out the masternode entries
```
rpcuser=<rpcusername>
rpcpassword=<rpcpassword>
rpcport=22332
listen=1
server=1
daemon=1
staking=0
rpcallowip=127.0.0.1
logtimestamps=1
masternode=1
port=22331
externalip=<externalip>:22331
masternodeprivkey=<masternode private key>
```

* Get the latest node seeds from [here](https://github.com/bsycum-network/seeds/blob/master/README.md)
* Copy and paste the addnode lines into the bottom of this file
* Save and Exit

## Start the BSYCUM Linux Daemon

* From the terminal session, run the following commands
```
./bsyc-3.1.0/bin/bsycd
```

## Wait for the BSYCUM Linux Daemon to sync

* From the terminal session, run the following commands
```
./bsyc-3.1.0/bin/bsyc-cli getinfo
```
* Compare the "Block Height" value with the latest from the [BSYCUM block explorer](https://explorer.bsycum.network/). When those are the same, your daemon is synchronized 

### Start your Linux VPS Masternode from Windows (For Windows Wallet Users)

[Starting your Linux VPS Masternode from Windows](LINUX-MN-START-WINDOWS.md)

### Start your Linux VPS masternode from Linux (For Linux Wallet Users)

#### Hot Wallet

Return back to the [Linux Hot Wallet Masternode Installation](LINUX-HOT.md)

#### Cold Wallet

Return back to the [Linux Cold Wallet Masternode Installation](LINUX-COLD.md)
