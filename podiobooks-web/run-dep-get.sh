#!/usr/bin/env bash
sudo docker run --rm -it \
        --volumes-from podiobooks-data \
	    --link podiobooks-db:db \
        --link podiobooks-redis:redis \
        podiobooks/podiobooks-web /opt/podiobooks/data/podiobooks/devscripts/docker/podiobooks_get_dep.sh
