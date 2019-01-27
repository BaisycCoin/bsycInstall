## BSYC masternode installation using ansible

This directory and subdirectories contains necessary files to install BSYC masternodes using ansible.


### structure

* ansible.cfg is the configuration file for ansible
* bsyc_mn.yml is our playbook
* hosts contains a definition of the hosts where BSYC masternodes are to be deployed
* templates directory contains a template for baisyccoin.conf
* files contains baisyccoind and baisyccoin-cli executables files

### Instructions

* download the content of this directory and its subdirs
* download BaisycCoin release files, extract them under files directory (if release has changed this writing > 1.0.0, adapt the path in bsyc_mn.yml)
* adapt hosts file with your vps IPs, masternodes aliases, priv keys, tx_hashes and tx_ids
* run ansible-playbook bsyc_mn.yml
* setup your masternode.conf on your wallet and restart it

* on your vps:
  * enjoy till the masternodes are synced (watch -d baisyccoin-cli getinfo)
  * kill previous watch and check masternode state (watch ips-cli masternode status)
  
* return to your wallet and start corresponding aliases; the watch in your vps should show "Masternode successfully started"

Have fun!
