#!/bin/bash
source ./servers.sh

servers=$( getAll )
for server in $servers
do
  echo $server
  addr=$( getAddr $server )
  addr="$(cut -d'@' -f2<<<"$addr")"
  echo $addr
  if [[ $server != abc ]];
  then
    nmap -sV --script=sniffer-detect $addr
  fi
done
