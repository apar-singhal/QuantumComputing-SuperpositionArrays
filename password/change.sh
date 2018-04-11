#!/bin/bash

# Basic arithmetic using let

echo $1 $2 $3
serverName=$1

if [[ $4 == '-' ]];
  then
   old_pswd=$2
  else
   start=$2
   old_pswd=$( ./getPassword.sh $start )
fi
echo $old_pswd

if [[ $4 == '--' ]];
  then
   new_pswd=$3
  else
   start=$3
   new_pswd=$( ./getPassword.sh $start )
fi
echo $new_pswd

source ./servers.sh
addr=$( getAddr $serverName )
if [[ $addr == YOU* ]] ;
  then  
  echo $addr
  exit 0
fi
echo $addr

rm ctp.sh
echo "passwd <<EOF" >> ctp.sh
echo "$old_pswd" >> ctp.sh
echo "$new_pswd" >> ctp.sh
echo "$new_pswd" >> ctp.sh
echo "EOF" >> ctp.sh
echo "who | awk '!/root/{ cmd=\"pkill -KILL -u \" \$1; system(cmd)}'" >> ctp.sh
echo 'rm $0' >> ctp.sh
chmod 755 ctp.sh

sshpass -p "$old_pswd" scp ./ctp.sh $addr:/home/blueteam/.
sshpass -p "$old_pswd" ssh -o StrictHostKeyChecking=no $addr "chmod 755 /home/blueteam/ctp.sh"
sshpass -p "$old_pswd" ssh -o StrictHostKeyChecking=no $addr "/home/blueteam/ctp.sh"
