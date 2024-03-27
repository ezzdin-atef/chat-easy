#!/bin/bash -e

# If running the rails server then create or migrate existing database
bundle exec rake db:create
bundle exec rake db:migrate

exec "${@}"
