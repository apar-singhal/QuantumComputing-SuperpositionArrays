#!/bin/bash

# Basic arithmetic using let
serverName=$1

if [[ $3 == '-' ]];
  then
   pswd=$2
  else
   start=$2
   pswd=$( ./getPassword.sh $start )
fi
echo $pswd

source ./servers.sh
addr=$( getAddr $serverName )
if [[ $addr == YOU* ]] ;
  then
  echo $addr
  exit 0
fi
echo $addr

sshpass -p "$pswd" ssh -o StrictHostKeyChecking=no $addr
