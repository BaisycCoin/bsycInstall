# CryptoNeverSleeps BSYCUM Update Script
*If you used CryptoNeverSleeps installation script, this update will work for you*

## Linux VPS

### Connect to your Linux VPS over SSH

  * Use your favorite terminal application on Linux or Putty/Bitvise clients on Windows
  * Connect to a terminal session with the Linux VPS

### Download and set the permissions on the script

  * From the terminal session, run the following commands
  ```
  wget https://raw.githubusercontent.com/bsycum-network/guides/master/scripts/bsycum_update.sh
  ```
  ```
  chmod 755 bsycum_update.sh
  ```

### Run the update

  * From the terminal session, run the following commands
  ```
  ./bsycum_update.sh
  ```
### Check the BSYCUM Linux Daemon 
*Now check that the daemon is in sync and display the proper version*

  * From the terminal session, run the following commands
  ```
  cd bsyc-3.1.0/bin
  ```
  ```
  ./bsyc-cli getinfo
  ```

  * Compare the "Block Height" value with the latest from the [BSYCUM block explorer](https://explorer.bsycum.network/). When those are the same, your daemon is synchronized

  * Compare the version string displayed, if upgraded properly it will say ```"version" : 3010000```

### Check the BSYCUM Masternode Status
*Now check that the daemon is in sync and display the proper version*

  * From the terminal session, run the following commands
  ```
  cd bsyc-3.1.0/bin
  ```
  ```
  ./bsyc-cli masternode status
  ```

  * If you get Status 4 - Masternode successfully started - All finished

  * If it is Status 2 - Start the masternode.
