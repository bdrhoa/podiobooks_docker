sudo docker run -d --name="podiobooks-web" \
	-p 0.0.0.0:80:80 \
	--link podiobooks-db:db \
	--link podiobooks-redis:redis \
	--volumes-from podiobooks-data \
	podiobooks/podiobooks-web
