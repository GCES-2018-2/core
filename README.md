# SIGS - Sistema Inteligente de Gestão de Salas

![SIGS-image](https://user-images.githubusercontent.com/18387694/46635580-54b54c00-cb2b-11e8-8e16-b3d2e41de814.png)

[![Build Status](https://travis-ci.org/SIGS-UnB/core.svg?branch=develop)](https://travis-ci.org/SIGS-UnB/core)
[![Maintainability](https://api.codeclimate.com/v1/badges/5d55933a921b31e8471c/maintainability)](https://codeclimate.com/github/SIGS-UnB/core/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5d55933a921b31e8471c/test_coverage)](https://codeclimate.com/github/SIGS-UnB/core/test_coverage)
[![Ruby](https://img.shields.io/badge/ruby-2.5.1-blue.svg)](https://www.ruby-lang.org)
[![Rails](https://img.shields.io/badge/rails-5.0.2-blue.svg)](http://rubyonrails.org/)
[![MIT License](https://img.shields.io/badge/license-MIT%20License-blue.svg)](https://opensource.org/licenses/MIT)

SIGS is a Ruby on Rails website project design for UnB (University of Brasília). The project aims to facilitate and automate the process of allocation of university rooms by city officials, coordinators and other stakeholders. For more informations see the [The Wiki Project](https://github.com/fga-gpp-mds/2017.1-SIGS/wiki) (wrote in brazilian portuguese).

Further information about how to contribute and information about the project community, you may also want to read our [Contributing](https://github.com/SIGS-UnB/core/blob/develop/.github/CONTRIBUTING.md) document and our [Code of Conduct](https://github.com/SIGS-UnB/core/blob/develop/docs/CODE_OF_CONDUCT.md), we strongly recommend.

## Features

To see the features of the project [Click Here](https://github.com/SIGS-UnB/core/releases).

## License

To see the license of the project [Click Here](https://github.com/SIGS-UnB/core/blob/develop/LICENSE)

## Getting Started

The SIGS project uses Docker to isolate both the staging and production environment, the staging environment is also used to test new features and corrections. With Docker Compose both environments cited can be easily run with a few commands in your terminal (you should install and set up Docker and Docker Compose on your machine, see steps below). You may also run SIGS via rails serve, for this, you should enter the `SIGS` folder and run it as a normal rails web app, but we strongly recommend to not do so, if you still want to run this way, do it at your own risk.

### Set up using Docker

* Install Docker

  - [Download docker](https://docs.docker.com/engine/installation/)

* Install Docker Compose

  - [Download docker-compose](https://docs.docker.com/compose/install/)

* Build the container image
  * Development Environment

        $ docker-compose -f docker-compose-dev.yml build
    
  * Production Environment
  
        $ docker-compose -f docker-compose-prod.yml build
    
* Run the container
  * Development Environment

        $ docker-compose -f docker-compose-dev.yml up -d
    
  * Production Environment
  
        $ docker-compose -f docker-compose-prod.yml up -d

  * Homolog Environment
  
        $ docker-compose -f docker-compose-homolog.yml up -d
  
  **OBS**: The option `-d` is used to run SIGS in background mode, so, this way, you can still use your terminal after starting the docker of SIGS. If you want to see the container log just remove the `-d` option

* Set up the Database

  To create the database, run the migration and populate it with fictional data

        $ docker-compose run web rails db:create db:migrate db:seed

* Open the internet browser in http://localhost:3000/.

### Set up Production

1) Change environment variables on `production.env` file

2) If you want to get auto letsencrypt certificates uncomment nginx config.
```
#server {
#    listen 80;
#    server_name $SIGS_DOMAIN;

#    location / {
#        return 301 https://$host$request_uri;
#    }

#    location /.well-known/acme-challenge/ {
#        root /var/www/certbot;
#    }
#}

server {
    #listen 443 ssl;

    #ssl_certificate /etc/letsencrypt/live/$SIGS_DOMAIN/fullchain.pem;
    #ssl_certificate_key /etc/letsencrypt/live/$SIGS_DOMAIN/privkey.pem;
    #include /etc/letsencrypt/options-ssl-nginx.conf;
    #ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
}
```
3) Point DNS record to your External IP
4) Change your domain and email on `docker/prod/init-letencrypt.sh`
```
domains=(example.com)
email="example@email.com" # Adding a valid address is strongly recommended
```
5) Run `sudo ./docker/prod/init-letencrypt.sh` 
6) Run docker-compose -f docker-compose-prod.yml up --build
7) Open your favorite browser and navigate to your domain

### Using the application

* Login with the desired user.

      DEG User
      e-mail: "deg@unb.br"
      password: "123456"

      Coordinator User
      e-mail: "coordenador@unb.br"
      password: "123456"

      Administrative Assistant
      e-mail: "adm@unb.br"
      password: "123456"


### Deploy

Deploy SIGS is an easy task, all you have to do is follow these steps:

* First, clone our repository on your machine:

        $ git clone --depth=50 --branch=develop https://github.com/SIGS-UnB/core.git SIGS-GCES/core

* Now ensure that you have installed Docker and Docker Compose on your machine:
        
        $ docker --version
        $ Docker version 18.06.1-ce, build e68fc7a # terminal output
        $ docker-compose --version
        $ docker-compose version 1.21.2, build a133471 # terminal output

  **OBS**: This is an example output, the output may vary.

* (Optional) Configure your docker hub credentials on your `.bashrc` or `.profile` file:

        export DOCKERHUB_USER=<your-username>
        export DOCKERHUB_PASS=<your-dockerhub-password>

  Save the file and then run on your terminal:

        source ~/.bashrc

* Lastly, run the script deploy file on project's folder:

        bash scprit/deploy.sh

  You may run this script time to time to keep your SIGS up-to-date, just stay tuned on project's releases on this [link](https://github.com/SIGS-UnB/core/releases).

  **OBS**: You should correct the script to the right path on the 'docker compose' file, on line 15 to 17, and if you didn't set up your docker hub login credentials you should, as well, receive an error but that is expected.

Further configuration may be needed (nginx configurations, domain purchase and configurations, machine configurations and so on), but you're free to customize and run SIGS at your own way, remember, this is an open source project!

The project maintainers' deploy is running on a digitalocean droplet that's also easy to do and keep! You can access it from this [link](http://www.sigs-staging.tk:3000/).