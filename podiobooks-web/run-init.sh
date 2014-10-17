sudo docker run \
	--rm \
	--volumes-from podiobooks-data \
	podiobooks/podiobooks-web \
	/home/podiobooks/podiobooks-initial-setup.sh
