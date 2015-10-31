#!/usr/bin/env bash
sudo docker run --rm -it \
	--volumes-from podiobooks-data \
	--link podiobooks-db:db \
	--link podiobooks-redis:redis \
	podiobooks/podiobooks-web /bin/bash --login
