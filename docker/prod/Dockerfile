FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    mysql-client

RUN mkdir /SIGS-MES

WORKDIR /SIGS-MES

COPY SIGS/Gemfile /SIGS-MES/Gemfile
COPY SIGS/Gemfile.lock /SIGS-MES/Gemfile.lock
RUN bundle install

COPY . /SIGS-MES

RUN chmod +x SIGS/start-prod.sh

EXPOSE  3000
