#!/bin/bash
source ./servers.sh

echo $1

if [[ $2 == '-' ]];
  then
   old_pswd=$1
  else
   start=$1
   old_pswd=$( ./getPassword.sh $start )
fi
#echo $old_pswd

servers=$( getAll )
for server in $servers
do
  echo $server
  addr=$( getAddr $server )
  echo $addr
  sshpass -p "$old_pswd" ssh -o StrictHostKeyChecking=no $addr "who -all"
done
