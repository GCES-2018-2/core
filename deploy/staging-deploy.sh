#!/bin/bash
#
# Purpose: Continuous deploy on staging environment
#
# Author: João Pedro Sconetto <sconetto.joao@gmail.com>
# Author: Arthur Diniz <arthurbdiniz@gmail.com>

docker-compose -f ../docker-compose-dev.yml up --build -d
docker tag core_web $DOCKERHUB_USER/sigs-gces:latest
docker push $DOCKERHUB_USER/sigs-gces:latest
