sudo docker run --rm \
	--volumes-from podiobooks-data \
	-it podiobooks/podiobooks-db \
	/home/podiobooks/postgres-initial-setup.sh
