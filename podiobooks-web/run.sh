sudo docker run -d --name="podiobooks-web" \
	-p 127.0.0.1:60080:80 \
	--link podiobooks-db:db \
	--link podiobooks-redis:redis \
	--volumes-from podiobooks-data \
	podiobooks/podiobooks-web
