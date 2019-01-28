# Savenode Masternode Setup Guide (Ubuntu 16.04)
***
## Required
1) **32000 SNO coins**
2) **Local Wallet https://github.com/savenode/SaveNodeCore/releases**
3) **VPS with UBUNTU 16.04**
4) **Putty https://www.putty.org/**
5) **Text editor on your local pc to save data for copy/paste**
***

***On your Local Wallet***
* Create an address with a label MN1 and send exactly 32000 SNO to it. Wait to complete 6 confirmations on “ Payment to yourself “ created.

* Open the Debug Console ( Tools – Debug Console ) and type ***masternode genkey***.
You will then receive your private key, save it in a txt to use it later.
  ```
  Example:
          masternode genkey
          w8723KqiiqtiLH6y2ktjfwzuSrNucGAbagpmTmCn1KnNEeQTJKf
* Still at Debug Console type ***masternode outputs*** and save txhash and outputidx on a txt
  ```
  Exemple:
          "txhash" : "12fce79c1a5623aa5b5830abff1a9feb6a682b75ee9fe22c647725a3gef42saa",
		         "outputidx" : 0

***On Putty***

* Once logged in your vps, *copy/past* each line one by one with *Enter*

	:arrow_forward: `wget -q https://raw.githubusercontent.com/savenode/MN/master/sndinstall.sh`

	:arrow_forward: `chmod +x sndinstall.sh`

	:arrow_forward: `./sndinstall.sh`

Let this run, and when prompted for a masternode key, copy the one you got previously (masternode genkey) and press enter.

It will take a couple of minutes to complete and then will present you a similar board like this: 

![Example-Logo](https://cdn.discordapp.com/attachments/451822135464427521/484158919430766612/3.JPG)

Remember to do `savenode-cli getblockcount` to check if VPS sync with chain

Do not close your terminal/ command prompt window at this point.

***Go back to your Local Wallet***

* Open the Masternode Configuration file (tools – open masternode configuration file) and add a new line (without #) using this template (bold needs to be changed) in the final save it and close the editor

**ALIAS VPS_IP**:29711 **masternodeprivkey TXhash Output**

		Example:
		MN1 125.67.32.10:29711 w8723KqiiqtiLH6y2ktjfwzuSrNucGAbagpmTmCn1KnNEeQTJKf
		12fce79c1a5623aa5b5830abff1a9feb6a682b75ee9fe22c647725a3gef42saa 0

* Close and Re-open Local Wallet, and at Masternode Tab you will find your MN with status MISSING

***(For the next steps you need to have already 21 confirmation on “Payment to yourself “ created in first step)***

* At Masternode Tab choose the Masternode with the status MISSING and press “ Start Alias “.
	(if you get an error, just move to next step)

* Go to Debug Console type the following: ***startmasternode alias 0 (mymnalias)***

		Example:
		startmasternode alias 0 MN1
***

***Go back to Putty***

   :arrow_forward: `./savenode-cli masternode status`

You need to get **"status" : 4**

## Congratulations your Savenode node it's running
