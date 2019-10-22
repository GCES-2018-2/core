FROM ruby:2.5.5

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    postgresql-client

# Set working directory, where the commands will be ran:
WORKDIR /sigs

# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production' 

# Adding gems
COPY Gemfile /sigs/Gemfile
COPY Gemfile.lock /sigs/Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test 

# Adding project files
ADD . /sigs/
RUN bundle exec rake assets:precompile

EXPOSE  3000
ENTRYPOINT ["docker/prod/entrypoint.sh"]

