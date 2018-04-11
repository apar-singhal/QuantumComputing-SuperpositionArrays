#!/bin/bash
source ./servers.sh

servers=$( getAll )
for server in $servers
do
  echo $server
  addr=$( getAddr $server )
  addr="$(cut -d'@' -f2<<<"$addr")"
  echo $addr
  sudo nmap -sn -PE $addr
done
