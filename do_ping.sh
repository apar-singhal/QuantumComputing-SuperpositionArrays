#!/bin/bash
source ./servers.sh

# Basic arithmetic using let

servers=$( getAll )
for server in $servers
do
  echo $server
  addr=$( getAddr $server )
  #echo $addr
  if [[ $server != abc ]];
  then
    addr="$(cut -d'@' -f2<<<"$addr")"
    echo $addr
    sudo nmap -sn -PE $addr
  fi

done
