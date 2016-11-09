#!/bin/bash

HOME_ADDRESS=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
MANAGER_TOKEN=`sudo docker swarm join-token manager 2>/dev/null |awk '/--token/ {print $2}'`
WORKER_TOKEN=`sudo docker swarm join-token worker 2>/dev/null |awk '/--token/ {print $2}'`

#for each line of nodes in file
while IFS='' read -r line || [[ -n "$line" ]]; do

    #get Address and role of line
    ADDRESS=$(echo $line | cut -f1 -d' ')
    ROLE=$(echo $line | cut -f2 -d' ')
    #cho "$ADDRESS will be a: $ROLE"

    echo -e "\E[1;33mStart $ADDRESS as $ROLE"
    tput sgr0

    if [ "$ROLE" == "manager" ]; then
      ssh -oStrictHostKeyChecking=no ubuntu@$ADDRESS "sudo docker swarm join --token $MANAGER_TOKEN $HOME_ADDRESS:2377"
    elif [ "$ROLE" == "worker" ]; then
      ssh -oStrictHostKeyChecking=no ubuntu@$ADDRESS "sudo docker swarm join --token $WORKER_TOKEN $HOME_ADDRESS:2377"
    fi



done < "$1"
