#!/bin/sh

set -e 

echo "ENVIRONMENT: $RAILS_ENV"

# remove pid from previous session

rm -rf $APP_PATH/tmp/pids/server.pid

bundle exec rails db:migrate
bundle exec rails webpacker:install
bundle exec rails server -p 3000 -b 0.0.0.0