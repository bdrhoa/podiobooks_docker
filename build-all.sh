#!/usr/bin/env bash
cd podiobooks-centos-base;./build.sh;cd ..  # This one has to be first, after which it doesn't matter
cd podiobooks-bu;./build.sh;cd ..
cd podiobooks-data;./build.sh;cd ..
cd podiobooks-db;./build.sh;cd ..
cd podiobooks-redis;./build.sh;cd ..
cd podiobooks-varnish;./build.sh;cd ..
cd podiobooks-web;./build.sh;cd ..
