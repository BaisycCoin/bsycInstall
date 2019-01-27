#/bin/bash

cd ~
echo "****************************************************************************"
echo "****************************************************************************"
echo "****************************************************************************"
echo "****************************************************************************"
echo "****************************************************************************"
echo "* Ubuntu 18.04 is the recommended opearting system for this install.       *"
echo "*                                                                          *"
echo "* This script will install and configure your BaisycCoin Masternode.       *"
echo "****************************************************************************"
echo && echo && echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo && echo && echo

echo "Do you want to install all needed dependencies (no if you did it before)? [y/n]"
read DOSETUP

if [[ $DOSETUP =~ "y" ]] ; then
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y dist-upgrade
  sudo apt autoremove -y
  sudo apt-get install -y nano htop git
  sudo apt-get install -y software-properties-common
  sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
  sudo apt-get install -y libboost-all-dev
  sudo apt-get install -y libevent-dev
  sudo apt-get install -y libminiupnpc-dev
  sudo apt-get install -y autoconf
  sudo apt-get install -y automake unzip
  sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
  sudo apt-get update
  sudo apt-get install -y libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libevent-dev

  cd /var
  sudo touch swap.img
  sudo chmod 600 swap.img
  sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=3000
  sudo mkswap /var/swap.img
  sudo swapon /var/swap.img
  sudo free
  sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
  cd
  
fi 
cd ~
sudo ./baisyccoin-cli -daemon stop
echo "! Stopping BaisycCoin Daemon !"

echo "! Removing BaisycCoin !"
sudo rm -f baisyccoind
sudo rm -f baisyccoin-cli
sudo rm -f baisyccoin-qt

wget https://github.com/BaisycCoin/BaisycCoin/releases/download/v1.0.0/baisyccoin-1.0.0-x86_64-linux-gnu.tar.gz
tar -zxvf baisyccoin-1.0.0-x86_64-linux-gnu.tar.gz

cd baisyccoin-1.0.0/bin/

./baisyccoind
