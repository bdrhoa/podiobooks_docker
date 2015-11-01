#!/usr/bin/env bash
# This file stops all the containers
./build-all.sh # Build All the Images
./podiobooks-db/stop.sh # Stop up the Postgres container
./podiobooks-redis/stop.sh # Stop the Redis container
./podiobooks-varnish/stop.sh # Start up the Varnish container
./podiobooks-web/stop.sh # Stop the Web Layer


