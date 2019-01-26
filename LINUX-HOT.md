# Linux Hot Wallet Masternode Installation

## Get your Linux VPS external IP address

  * Record the external IP of your VPS instance, it will be used in the next step
  * Configure your VPS firewall to accept incoming connections on port 64758

## Install the Linux VPS BaisycCoin Daemon

[Linux VPS BaisycCoin Daemon Installation Guide](LINUX.md)

## Generate your masternode private key

* From the terminal session, run the following commands
```
./baisyccoin-1.0.0/bin/baisyccoin-cli masternode genkey
```
* Record this key, you'll need it in later steps

## Get your BaisycCoin Linux Wallet Address

  * From the terminal session, run the following commands
  ```
  ./baisyccoin-1.0.0/bin/baisyccoin-cli getaccountaddress 0
  ```
  * Record this address, you'll need it in the next step
  
## Send your BSYC Masternode collateral transaction

  * Send exactly 5000 BSYC to your wallet address you recorded in the step above.
  * This is critical to get right, it cannot be any other amount other than 5000 BSYC. No more, no less

## Get your Masternode transaction output value
*Once you have recieved your masternode collateral transaction in your Windows wallet proceed with this step*

  * From the terminal session, run the following commands
  ```
  ./baisyccoin-1.0.0/bin/baisyccoin-cli masternode outputs
  ```
  * Record this value, as you'll need it in the next step

## Create your Masternode configuration file

  * In the ~/.baisyccoin directory, edit the masternode.conf as described below
  * Replace each < > field with the information obtained from the steps above.
    * ```<alias> <externalip>:64758 <masternode private key> <collateral txid> <collateral txid output>```
  * Example
    * ```mn1 167.99.234.180:64758 5dGdBDCYqMae1oRhH7djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 25dGdBDCYqasd123Mae1oRhH7asd123djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 0```
    
## Edit your BaisycCoin Linux Daemon configuration file

* From the terminal session, run the following commands
```
cd  ~/.baisyccoin
nano ~/.baisyccoin/baisyccoin.conf
```

* Uncomment the masternode entries, replace any < > field with your information
```
rpcuser=<rpcusername>
rpcpassword=<rpcpassword>
rpcport=64759
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

## Stop the BaisycCoin Linux Daemon and restart it

* From the terminal session, run the following commands
```
./baisyccoin-3.1.0/bin/bsyc-cli stop
./bsyc-3.1.0/bin/bsycd
```

### Start your Linux VPS masternode from Linux (For Linux Wallet Users)
*Ensure the wallet is in sync before proceeding*

[Starting your Linux VPS Masternode](LINUX-MN-START.md)
