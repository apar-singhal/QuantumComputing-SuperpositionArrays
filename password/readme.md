## Descripton
=============
These scripts help to quickly change the passwords of different instances, without logging into the server and typing the passwords inside the servers. In many competitions where we need to secure the servers, the first step is to change the password, but many times a keylogger is already installed by which the hackers (or red team) can get your new passwords. Apart from that it takes time to manually change passwords of each instance, and then to retype it while logging.

Below scripts can be used to safely and easily change the passwords and ssh into the servers, without typing the actual passwords. You only need a passkey which could be any integer and you can write your own logic to generate a password from that key. Make sure one passkey always generates the same password. Length of the actual password could be as long as you want.

====

### prereq.sh
This script is used to install 'sshpass' which is used in other scripts.
How to run: ./prereq.sh


### servers.sh
This script contains the list of servers, with their names and IP Address. We will use these names  to login or changing passwords. This is used to print the username@ip_address of a given server
How to run: ./servers.sh <server_name>


### getPassword.sh
This script generates and prints a password of fixed length corresponding to the input provided. Passwords are generated from a file 'password.txt'. I have not uplaoded the file here, you can use any file and give its name. You can change the logic to select password from the file.
How to run: ./getPassword.sh <pass_key>

### login.sh
This script logins into the server. You only need to provide the name of the server as used in servers.sh and the passkey used by getPassword.sh to generate password.
How to run: ./login.sh <server_name> <pass_key>

### change.sh
This script changes the password of a single server. You only need to provide the name of the server as used in servers.sh and two passkeys which will be used by getPassword.sh. First passkey should correspond to the current password and second passkey should correspond to the new password.
You can also pass - or -- at the end. '-' is used is you provide actual password instead of first passkey. '--' means you have provided new password instead of second passkey. 
How to run: ./change.sh <server_name> <pass_key>

### changeAll.sh
This script changes the password of all the servers mentioned in servers.sh. You only need to provide two passkeys which will be used by getPassword.sh. First passkey should correspond to the current password and second passkey should correspond to the new password. (We need the passkeys for all the servers to be same)
You can also pass - or -- at the end. '-' is used is you provide actual password instead of first passkey. '--' means you have provided new password instead of second passkey. 
How to run: ./change_all.sh <old_pass_key> <new_pass_key>
