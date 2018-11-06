#!/bin/bash
#
# Purpose: Continuous deploy on staging environment
#
# Author: João Pedro Sconetto <sconetto.joao@gmail.com>
# Author: Arthur Diniz <arthurbdiniz@gmail.com>

docker-compose -f ../docker-compose-dev.yml up --build -d
docker tag sigsgces_web $DOCKERHUB_USER/sigs-gces:latest
docker push $DOCKERHUB_USER/sigs-gces:latest

sudo apt-get update
sudo apt-get install sshpass -y
sshpass -p $SSH_PASSWORD ssh $SSH_USER@$SSH_ADDRESS '/bin/bash /home/sigs/SIGS-GCES/script/deploy.sh'