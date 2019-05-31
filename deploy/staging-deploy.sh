#!/bin/bash
#
# Purpose: Continuous deploy on staging environment
#
# Author: João Pedro Sconetto <sconetto.joao@gmail.com>
# Author: Arthur Diniz <arthurbdiniz@gmail.com>

docker build -t $DOCKERHUB_USER/sigs-gces:latest -f docker/prod/Dockerfile .
docker push $DOCKERHUB_USER/sigs-gces:latest
