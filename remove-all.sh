#!/usr/bin/env bash
# This file removes all the old containers
./stop-all.sh
docker ps -a | grep 'podiobooks' | awk '{print $1}' | xargs --no-run-if-empty docker rm

