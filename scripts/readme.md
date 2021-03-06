# BaisycCoin v1.0.0 Masternode Setup Guide [ Ubuntu 18.04 ]

THIS GUIDE IS FOR ROOT USERS -

YOU MUST BE A MEMBER OF THE FOLLOWING GROUP
```
User=root
Group=root
```

Shell script to install a [BaisycCoin Masternode](https://baisyc.io/) on a Linux server running Ubuntu 18.04. Use it on your own risk.
***

## Private Key

**This script can generate a private key for you, or you can generate your own private key on the Desktop software.**

Steps generate your own private key. 
1.  Download and install BaisycCoin 1.0.0 for Windows -   Download Link  - https://github.com/BaisycCoin/BaisycCoin/releases/
2.  Open the BaisycCoin Wallet
3.  Go to **Tools -> Click "Debug Console"** 
4.  Type the following command: **masternode genkey** 
5. You now have your generated **Private Key**  (MasternodePrivKey)


## VPS installation
```
wget -q https://github.com/BaisycCoin/bsycInstall/scripts/bsyc-install.sh
bash bsyc-install.sh
```
Once the VPS installation is finished.

Check the block height

We want the blocks to match whats on the BaisycCoin block explorer (https://explorer.baisyc.io/)

Once they match you can proceed with the rest of the guide.

Check the block height with the following command
```
watch baisyccoin-cli getinfo
```
Make sure the version number matches.
```
"version" : 1000001,     ------------------This is the latest version (baisyccoin-v1.0.0)
```

Once the block height matches the block explorer issue the following command.
```
CTRL and C  at the same time  (CTRL KEY and C KEY)
```
***

## Desktop wallet setup  

After the MN is up and running, you need to configure the desktop wallet accordingly. Here are the steps: 
1. Open the BaisycCoin Desktop Wallet. 
2. Go to RECEIVE and create a New Address: **MN1** 
3. Send **5000** BaisycCoin to **MN1**. You need to send all 5000 coins in one single transaction.
4. Wait for 15 confirmations. 
5. Go to **Tools -> Click "Debug Console"** 
6. Type the following command: **masternode outputs** 
7. Go to  **Tools -> "Open Masternode Configuration File"**
8. Add the following entry:
```
Alias Address Privkey TxHash TxIndex
```
* Alias: **MN1**
* Address: **VPS_IP:PORT**
* Privkey: **Masternode Private Key**
* TxHash: **First value from Step 6**
* TxIndex:  **Second value from Step 6**
9. Save and close the file.
10. Go to **Masternode Tab**. If you tab is not shown, please enable it from: **Settings - Options - Wallet - Show Masternodes Tab**
11. Click **Update status** to see your node. If it is not shown, close the wallet and start it again. Make sure the wallet is un
12. Select your MN and click **Start Alias** to start it.
13. Alternatively, open **Debug Console** and type:
```
masternode start-alias MN1
``` 
14. Login to your VPS and check your masternode status by running the following command:.
```
baisyccoin-cli masternode status
```
***

## Usage:
```
baisyccoin-cli masternode status 
baisyccoin-cli getinfo
```
Also, if you want to check/start/stop **BaisycCoin**, run one of the following commands as **root**:

```
systemctl status BaisycCoin          #To check if BaisycCoin service is running 
systemctl start BaisycCoin           #To start BaisycCoin service 
systemctl stop BaisycCoin            #To stop BaisycCoin service 
systemctl is-enabled BaisycCoin      #To check if BaisycCoin service is enabled on boot 
``` 
***

## Donations

Any donation is highly appreciated

**BSYC**: BMKxCnevQ6kuDNVsNpA8GceJU6s7RD6QnE 
