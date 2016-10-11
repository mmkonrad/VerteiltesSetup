#!/bin/bash

echo -e "\E[1;33mSTOP/REMOVING LOCAL CONTAINERS"
tput sgr0
source /home/ubuntu/VerteiltesSetup/stop_cont.sh

echo -e "\E[1;33mSTOP/REMOVE REMOTE CONTAINERS 150"
tput sgr0
ssh ubuntu@10.43.116.150 'bash -s' < /home/ubuntu/VerteiltesSetup/stop_cont.sh

echo -e "\E[1;33mSTOP/REMOVE REMOTE CONTAINERS 150"
tput sgr0
ssh ubuntu@10.43.116.153 'bash -s' < /home/ubuntu/VerteiltesSetup/stop_cont.sh



echo -e "\E[1;33mREMOVE OVERLAY NETWORK"
tput sgr0
sudo docker network rm reservierung



echo -e "\E[1;33mSTOP ETCD+LOGS+FILES"
tput sgr0
sudo service etcd stop
sudo rm /var/log/etcd.log
sudo rm -r /var/etcd/*
sudo rm -r /var/etcd



echo -e "\E[1;33mSTOP LOCAL DOCKER+LOGS"
tput sgr0
source /home/ubuntu/VerteiltesSetup/stop_docker.sh

echo -e "\E[1;33mSTOP REMOTE DOCKER+LOGS 150"
tput sgr0
ssh ubuntu@10.43.116.150 'bash -s' < /home/ubuntu/VerteiltesSetup/stop_docker.sh

echo -e "\E[1;33mSTOP REMOTE DOCKER+LOGS 150"
tput sgr0
ssh ubuntu@10.43.116.153 'bash -s' < /home/ubuntu/VerteiltesSetup/stop_docker.sh



echo -e "\E[1;33mINIT/START ETCD"
tput sgr0
source /home/ubuntu/VerteiltesSetup/etcd.sh
echo -e "\E[1;33mRESTART LOCAL DOCKER"
tput sgr0
source /home/ubuntu/VerteiltesSetup/init.sh 10.43.116.154
echo -e "\E[1;33mSTART CONSUL"
tput sgr0
source /home/ubuntu/VerteiltesSetup/consul_setup.sh
echo -e "\E[1;33mSTART SWARM MANAGER"
tput sgr0
source /home/ubuntu/VerteiltesSetup/swarm_manager.sh 10.43.116.154


echo -e "\E[1;33mRESTART NODE ON 150"
tput sgr0
ssh ubuntu@10.43.116.150 'bash -s' < /home/ubuntu/VerteiltesSetup/node_reset.sh
echo -e "\E[1;33mRESTART NODE ON 153"
tput sgr0
ssh ubuntu@10.43.116.153 'bash -s' < /home/ubuntu/VerteiltesSetup/node_reset.sh


