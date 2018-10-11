#!/bin/bash

if [ ! -d tmp ]; then
  mkdir tmp
fi

if [ ! -d tmp/pids ]; then
  mkdir tmp/pids
fi

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle check || bundle install --jobs 20 --retry 5
bundle exec rake db:create
bundle exec rake db:migrate
yarn install

exec "$@"
