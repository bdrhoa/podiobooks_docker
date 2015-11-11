#!/usr/bin/env bash
sudo docker run -d --name="podiobooks-db" \
	--volumes-from podiobooks-data \
	podiobooks/podiobooks-db
