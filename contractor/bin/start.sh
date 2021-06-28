#!/bin/bash

rm -f tmp/pids/server.pid

bundle check || bundle install

bin/rails s -b 0.0.0.0
