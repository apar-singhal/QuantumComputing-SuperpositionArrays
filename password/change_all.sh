#!/bin/bash
source ./servers.sh

# Basic arithmetic using let

echo $1 $2

if [[ $3 == '-' ]];
  then
   old_pswd=$1
  else
   start=$1
   old_pswd=$( ./getPassword.sh $start )
fi
echo $old_pswd

if [[ $3 == '--' ]];
  then
   new_pswd=$2
  else
   start=$2
   new_pswd=$( ./getPassword.sh $start )
fi
echo $new_pswd

rm ctp.sh
echo "passwd <<EOF" >> ctp.sh
echo "$old_pswd" >> ctp.sh
echo "$new_pswd" >> ctp.sh
echo "$new_pswd" >> ctp.sh
echo "EOF" >> ctp.sh
echo "who | awk '!/root/{ cmd=\"pkill -KILL -u \" \$1; system(cmd)}'" >> ctp.sh
echo 'rm $0' >> ctp.sh
chmod 755 ctp.sh

servers=$( getAll )
for server in $servers
do
  echo $server
  addr=$( getAddr $server )
  echo $addr
  echo "$addr $new_pswd" >> pswdlogs.txt
  if [[ $server != abc ]];
  then 
   sshpass -p "$old_pswd" scp ./ctp.sh $addr:/home/blueteam/.
   sshpass -p "$old_pswd" ssh -o StrictHostKeyChecking=no $addr "chmod 755 /home/blueteam/ctp.sh"
   sshpass -p "$old_pswd" ssh -o StrictHostKeyChecking=no $addr "/home/blueteam/ctp.sh"
  fi
done
