#!/bin/sh

set -e 

echo "ENVIRONMENT: $RAILS_ENV"

#CHECK BUNDLE
bundle check || bundle install

# remove pid from previous session

rm -rf $APP_PATH/tmp/pids/server.pid

bundle exec ${0}