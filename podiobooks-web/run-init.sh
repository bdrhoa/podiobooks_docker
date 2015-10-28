sudo docker run \
	--rm \
	--volumes-from podiobooks-data \
	podiobooks/podiobooks-web \
	/opt/podiobooks/podiobooks-initial-setup.sh
