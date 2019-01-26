# Linux Cold Wallet Masternode Installation

## Get your Linux VPS external IP address

  * Record the external IP of your VPS instance, it will be used in the next step
  * Configure your VPS firewall to accept incoming connections on port 64758

## Install the Linux VPS BaisycCoin Daemon

[Linux VPS BaisycCoin Daemon Installation Guide](LINUX.md)

## Install the Linux Cold BaisycCoin Daemon

[Linux VPS BaisycCoin Daemon Installation Guide](LINUX.md)

## Generate your masternode private key on the cold wallet

* From the terminal session, run the following commands
```
./bsyc-3.1.0/bin/bsyc-cli masternode genkey
```
* Record this key, you'll need it in later steps

## Get your BaisycCoin Linux Wallet Address on the cold wallet

  * From the terminal session, run the following commands
  ```
  ./bsyc-3.1.0/bin/bsyc-cli getaccountaddress 0
  ```
  * Record this address, you'll need it in the next step
  
## Send your BSYC Masternode collateral transaction to the cold wallet

  * Send exactly 5000 BSYC to your wallet address you recorded in the step above.
  * This is critical to get right, it cannot be any other amount other than 5000 BSYC. No more, no less

## Get your Masternode transaction output value on the cold wallet
*Once you have recieved your masternode collateral transaction in your Windows wallet proceed with this step*

  * From the terminal session, run the following commands
  ```
  ./bsyc-3.1.0/bin/bsyc-cli masternode outputs
  ```
  * Record this value, as you'll need it in the next step

## Create your Masternode configuration file on the VPS

  * In the ~/.bsyc directory, edit the masternode.conf as described below
  * Replace each < > field with the information obtained from the steps above.
    * ```<alias> <externalip>:64758 <masternode private key> <collateral txid> <collateral txid output>```
  * Example
    * ```mn1 167.99.234.180:64758 5dGdBDCYqMae1oRhH7djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 25dGdBDCYqasd123Mae1oRhH7asd123djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 0```
    
## Edit your BaisycCoin Linux Daemon configuration file on the VPS

* From the terminal session, run the following commands
```
cd  ~/.bsyc
nano ~/.bsyc/bsyc.conf
```

* Uncomment the masternode entries, replace any < > field with your information
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
#masternode=1
port=64758
externalip=<externalip>:64758
#masternodeprivkey=<masternode private key>
```

* Save and Exit

## Stop the BaisycCoin Linux Daemon and restart it on the VPS

* From the terminal session, run the following commands
```
./bsyc-3.1.0/bin/bsyc-cli stop
./bsyc-3.1.0/bin/bsycd
```

### Start your Linux VPS masternode from Linux (For Linux Wallet Users)
*Ensure the wallet is in sync before proceeding*

[Starting your Linux VPS Masternode](LINUX-MN-START-LINUX.md)

