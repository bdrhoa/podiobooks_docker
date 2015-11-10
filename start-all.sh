#!/usr/bin/env bash
# This file starts all the containers
./podiobooks-data/start.sh # Start up the Data container
./podiobooks-db/start.sh # Start up the Postgres container
./podiobooks-redis/start.sh # Start the Redis container
./podiobooks-varnish/start.sh # Start up the Varnish container
./podiobooks-web/start.sh # Start the Web Layer


