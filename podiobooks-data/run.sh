#!/usr/bin/env bash
sudo docker run --name="podiobooks-data" \
	-v /opt/podiobooks/data \
	podiobooks/podiobooks-data \
