#!/usr/bin/env bash
# This file starts up supervisord with nginx and uwsgi on a single-server non-docker instance

cd /opt/podiobooks/data/podiobooks
. .env/bin/activate
supervisord -c /opt/podiobooks/data/supervisord.conf