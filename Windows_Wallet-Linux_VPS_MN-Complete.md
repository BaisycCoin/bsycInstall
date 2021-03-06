# BaisycCoin Windows and Linux Wallet - Linux VPS Masternode Instructions

## Requirements:
* A local Masternode Wallet with the required Masternode collateral (5000 BSYC).
* A GNU/Linux VPS with a Static IP Address referred as __<your vps IP>__ in this document.

* For this guide we are using Ubuntu 18.04 on the VPS, but any distro should do as the executables are statically linked. 
* A 25GB SSD and 1000GB bandwidth will suffice (suggested vultr or digital ocean; use those referral links to support BaisycCoin: [vultr](https://www.vultr.com/) and [Digital Ocean](https://www.digitalocean.com/)).
* Select IPV6 and Private Networking. I will leave DDoS and Automatic backups to you. 
* Leave SSH Keys and Startup Script blank.


## Setup Wallet:

* Download the latest wallet for your OS [Releases](https://github.com/BaisycCoin/BaisycCoin/releases)
* For Windows users:
  * run the installer, and leave everything as default.
* For GNU/Linux users:
* untar the archive where you please (you may copy baisyccoin-qt, baisyccoind and baisyccoin-cli in /usr/local/bin for easy access)
* Run the qt, then close it again.


### Addresses

* Whilst it is syncing, create two addresses in the receiving tab. For one, I always use the name of exchange I have purchased the coin from. In this instance it will be called “Graviex”. The other will be called MN1 (For your masternode).

### Wallet Adjustments

* Through options, enable Coin Control, as well as the Masternodes tab (under “Wallet”). As this will require a wallet restart, you may as well go through and change things as you see fit. i.e. Decimals Digits, Interface Theme, and Map Port using UPnP.
* Once this is complete, encrypt your wallet. Once encryption is complete, your wallet will close. Reopen it.

### Exchange

* Open your exchange, and transfer at least 5001 coins to the “Graviex” address. Be sure to account for exchange fees.
* You should receive your coins almost instantly. Please wait for them to confirm before proceeding.

### Coin Control

* Coin Control is how we will create a transaction of *exactly* 5000 BSYC. This is necessary, as any other amount is ineligible for a MN status.
* Copy your MN1 address to the clipboard.
* Open the send tab.
* Choose “Inputs” at the top left of the window.
* It should have “List Mode” checked. If not, check it.
* You will see your transaction under the label Graviex. Check it on the left hand panel and click OK.
* Paste your MN1 address in the “Pay To” section. The label “MN1” should automatically be displayed.
* Input 5000 into the “Amount” section.
* Press send, and pay any transaction fees.
* After 2 minutes, open Coin Control again. You should see a transaction of exactly 5000 BSYC under MN1. Wait for it to receive 15 confirmations before the next step.

### Masternode Info

* If your wallet is locked, unlock it.
* From the tools menu, open the __Debug Console__ and __open the masternode configuration file__.
* In your masternode configuration file, input a new line:

```MN1 <your vps IP>:64758 ```

* In the debug console, input the command:

```masternode genkey```

* This gives you your \<masternode privkey>. Copy it in your masternode configuration file after 64758 (keep a space between 64758 and the masternode privkey) and keep your masternode priv key secret.

* Be sure the 5000BSYC payment to MN1 have reached at least 15 confirmations before inputing the following command:
  
```masternode outputs```

* This gives you a \<transaction hash> (long string of nonsense) and an \<index> (0 or 1)
  Add this to your masternode configuration file which should now look like this:
  
```MN1 <your vps IP>:64758 <masternode privkey> <transaction hash> <index>```

  similar to the following line:
  
```MN1 111.222.111.222:64758 df1265465465432KSJBFNSKJ aLJKHVBSFDLJHGbcdeSFKJSFf654321abcdef321654abcdef321654 1```

* Save and close your masternode configuration file.

* Close the debug console.

### That is all you need to do with your Wallet for now.


## SETUP MASTERNODE DAEMON:

* Connect and login to your vps using ssh and the credentials provided by your VPS provider:
  * under GNU/Linux:
  
```ssh root@<your vps IP>```

  * under Windows using [putty](https://www.putty.org/)(under Windows):
    * Type the IP address of your VPS below ‘Host Name (or IP address)’
    * Select ‘SSH’ as Connection type.
    * Click ‘Open’, and a New Terminal should open.
    * It will request your login and password, enter the supplied credentials from your VPS provider. (Keep in mind, your password will not display at log in. Shift+Ins will allow you to paste into putty from Windows).
    
### Now we should be connected to our VPS, let's input the following commands in our VPS terminal:

* Let's begin with adding a new user for baisyccoin, our user will be called baisyccoin:

```adduser baisyccoin```

Answer the questions and choose a [good password](https://www.howtogeek.com/195430/how-to-create-a-strong-password-and-remember-it/)

* Let's switch to our new user:

```sudo -u baisyccoin -i```

Now that we are baisyccoin, we can retrieve the baisyccoin files:

```wget https://github.com/BaisycCoin/BaisycCoin/releases/download/v1.0.0/baisyccoin-1.0.0-x86_64-linux-gnu.tar.gz```

unpack them:

```tar -zxzf baisyccoin-1.0.0-x86_64-linux-gnu.tar.gz```

This will create a directory baisyccoin-1.0.0

* We may now revert to root:
```
exit
```

and place the programs in /usr/local/bin so that we won't need full path when running our BaisycCoin tools:
```
cp /home/BaisycCoin/baisyccoin-1.0.0/bin/baisyccoin* /usr/local/bin
chown root:root /usr/local/bin/baisyccoin*
```

* let's become baisyccoin user again:
```
sudo -u baisyccoin -i
```
Create a directory for the configuration:

```mkdir ~/.baisyccoin```

and edit the config file:

* and edit the config file:

```nano ~/.baisyccoin/baisyccoin.conf```

* Copy/paste:

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
masternode=1
port=64758
externalip=<externalip>:64758

masternodeprivkey=<masternode privkey>
```
* For \<rpcusername> and \<rpc password>, use any text you would like. You will not need to remember it, but once you start the daemon, do not change it.
* \<masternode privkey> is the key we obtained earlier using ```masternode genkey``` in the debug console of our wallet

* Use \<Ctrl> + o to save and \<Ctrl> + x to close our baisyccoin.conf

We may now start the server so that it begins to sync (note we don't need the full path to baisyccoind as it is in our $PATH variable):
```
baisyccoind -daemon
```

* Let's clean this place:

```rm baisyccoin-1.0.0-x86_64-linux-gnu.tar.gz README.md```

* Check the server is syncing:

```watch ./baisyccoin-1.0.0/bin/baisyccoin-cli getinfo```

You should see the __blocks__ field raising
* close this using \<Ctrl> + c


* to allow baisyccoind to start after a reboot we'll set a cronjob:

```crontab -e```

Choose nano as editor (or the one you prefer), then insert a new line:

```@reboot sleep 30 && /usr/local/bin/baisyccoind -daemon```

Save and close (if using nano as you now know \<Ctrl> + o to save, \<Ctrl> + x to quit)
It should say your crontab has been updated.

* You may safely exit the vps:
```
exit
exit
```

Yes, type exit twice: first one to revert to root and second one to exit the vps.

__Note:__ When you later connect to your vps, connect yourself using baisyccoin credentials (username baisyccoin and the __good password__ you specified when we created the user baisyccoin above)

## Let's finish: back to your wallet

* Go back to your Windows or Linux wallet, close it and restart it.
* Once it's resynced, go the __masternodes tab__.
* You should see your MN1 with a "MISSING" status.
* Click "Start Missing" at the bottom of the windows.
* The status should now show "ENABLED".
* Now wait until the masternode is fully synced and then you may admire the active time starting to raise.

Then expect the first masternode reward within __~60h__ and then __every ~20 hours__.

## Post accomplishment in Discord	

*After you have setup everything please take a screen capture of your node running in your wallet or type the IP and post it in #mn-hodler.

[Discord Channel](https://discord.gg/AJpCnSB)

Example:
144.202.51.69:64758

## Congratulations, you are now the operator of your very own BaisycCoin Masternode! This will support the integrity of the BaisycCoin network, as well as secure a passive income well into the future.


## Memo

Here's a list of common commands to be used on the vps to check MN' status:
```
baisyccoin-cli getinfo
baisyccoin-cli mnsync status
baisyccoin-cli masternode status
```


# To go further...

## Enhance security

### Update your vps
You should keep your vps up-to-date using regularly:

```
sudo apt update
sudo apt upgrade
```

### User connection
You should use __ssh key authentication__ instead of passwords to connect to your vps and refuse password connections to it.


###  [Firewall](https://github.com/grnt4v/guides/tree/master/scripts/firewall)

BaisycCoin uses tcp port 64758 IN and OUT, nothing else.
You also need http(s) OUT to be able to update your system and 22 IN to be able to connect using ssh.

So the only open ports on your vps should be IN: 64758 and OUT: 64758 80 443

I recommend using ferm as a firewall rule editor on your vps:

```sudo apt install ferm```

Add the following rule in /etc/ferm/ferm.conf
under INPUT:
```
proto tcp
dport 64758
mod state state NEW
ACCEPT;
```

tcp port 22 is opened by default and OUTPUT policy is ACCEPT (you may cange it to DROP and allow the needed protocols/ports)

After having modifyed your ferm rules, always use:
```
sudo ferm -i /etc/ferm/ferm.conf
```
to avoid being locked outside your VPS!

__Happy config!__
