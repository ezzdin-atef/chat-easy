#!/bin/bash -e

# If running the rails server then create or migrate existing database
./bin/rails db:create
./bin/rails db:migrate

exec "${@}"
