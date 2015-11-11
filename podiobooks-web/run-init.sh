#!/usr/bin/env bash
sudo docker run \
	--rm \
	--volumes-from podiobooks-data \
	--link podiobooks-db:db \
	podiobooks/podiobooks-web \
	/opt/podiobooks/podiobooks-initial-setup.sh
