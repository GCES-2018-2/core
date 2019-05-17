#!/bin/bash

function_postgres_ready() {
ruby << END
require 'pg'
begin
  PG.connect(dbname: "$POSTGRES_DB", user: "$POSTGRES_USER", password: "$POSTGRES_PASSWORD", host: "postgres")
rescue
  exit -1
else
  exit 0
end
END
}

until function_postgres_ready; do
  >&2 echo "POSTGRES IS UNAVAILABLE, SLEEP"
  sleep 1
done

echo "POSTGRES IS UP, CONTINUE"

bundle check || bundle install

bundle exec rake db:create RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
# bundle exec rake db:seed RAILS_ENV=production

pidfile='/sigs/tmp/pids/server.pid'

if [ -f $pidfile ]; then
	echo 'Server PID file already exists. Removing it...'
	rm $pidfile
fi

bundle exec rails s -p 3000 -b 0.0.0.0 -e production
