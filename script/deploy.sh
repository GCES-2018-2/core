#!/bin/bash
#
# Purpose: Script to run SIGS deploy
#
# Notice: The deploy machine should be previously
# configured with ambient variables to perform
# all of the needed actions
#
# Author: João Pedro Sconetto <sconetto.joao@gmail.com>

echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
docker pull projetosigs/sigs-gces:latest
git fetch origin
git pull origin develop
docker-compose -f /home/sigs/SIGS-GCES/docker-compose-dev.yml pull --include-deps db
docker-compose -f /home/sigs/SIGS-GCES/docker-compose-dev.yml up -d
docker-compose -f /home/sigs/SIGS-GCES/docker-compose-dev.yml run --rm web rails db:migrate RAILS_ENV=development