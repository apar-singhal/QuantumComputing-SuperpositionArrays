#!/bin/bash
source ./servers.sh

# Basic arithmetic using let

echo $1 $2

if [[ $2 == '-' ]];
  then
   old_pswd=$1
  else
   start=$1
   old_pswd=$( ./getPassword.sh $start )
fi
echo $old_pswd

servers=$( getAll )
for server in $servers
do
  echo $server
  addr=$( getAddr $server )
  #addr="$(cut -d'@' -f2<<<"$addr")"
  echo $addr
  if [[ $server != abc ]];
  then 
   sshpass -p "$old_pswd" ssh -o StrictHostKeyChecking=no $addr "netstat -pulnp"
  fi
done
