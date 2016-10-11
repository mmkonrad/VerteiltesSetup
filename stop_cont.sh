#!/bin/bash


if [[ $(sudo docker ps -aq) ]]; then
    sudo docker stop $(sudo docker ps -aq)
    sudo docker rm -v $(sudo docker ps -aq)
else
    echo "no files found"
fi




