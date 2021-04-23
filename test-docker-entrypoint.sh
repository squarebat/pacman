#!/bin/sh

set -e 

echo "ENVIRONMENT: $RAILS_ENV"

#CHECK BUNDLE
bundle check || bundle install
bundle exec ${0}