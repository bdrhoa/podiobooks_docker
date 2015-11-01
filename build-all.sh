#!/usr/bin/env bash
./podiobooks-centos-base/build.sh  # This one has to be first, after which it doesn't matter
./podiobooks-bu/build.sh
./podiobooks-data/build.sh
./podiobooks-db/build.sh
./podiobooks-redis/build.sh
./podiobooks-varnish/build.sh
./podiobooks-web/build.sh

