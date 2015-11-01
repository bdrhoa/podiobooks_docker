#!/usr/bin/env bash
# This file installs the entire system
./build-all.sh # Build All the Images
./podiobooks-data/run.sh # Set Up the Data Volume that all containers share
./podiobooks-db/run-init.sh # Initialize the database, Postgres-wise
./podiobooks-db/run.sh # Start up the Postgres container
./podiobooks-redis/run.sh # Start up the Redis container
./podiobooks-web/run-init.sh # Set up the web application
./podiobooks-web/run.sh # Start it up!


