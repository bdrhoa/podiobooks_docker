sudo docker run --rm \
	--volumes-from podiobooks-data \
	-it podiobooks/podiobooks-db \
	/opt/podiobooks/postgres-initial-setup.sh
