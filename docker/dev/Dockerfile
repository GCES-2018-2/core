FROM ruby:2.5.5

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    postgresql-client

# Set working directory, where the commands will be ran:
WORKDIR /sigs

# Setting env up
ENV RAILS_ENV='development'
ENV RACK_ENV='development' 

# Adding gems
COPY Gemfile /sigs/Gemfile
COPY Gemfile.lock /sigs/Gemfile.lock
RUN bundle install

# Adding project files
ADD . /sigs/

EXPOSE  3000
ENTRYPOINT ["docker/dev/entrypoint.sh"]
