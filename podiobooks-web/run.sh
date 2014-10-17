sudo docker run -d --name="podiobooks-web" \
	-p 127.0.0.1:50080:80 \
	--link podiobooks-db:db \
	--volumes-from podiobooks-data \
	podiobooks/podiobooks-web
