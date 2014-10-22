sudo docker run -d --name="podiobooks-redis" \
	--volumes-from podiobooks-data \
	podiobooks/podiobooks-redis
