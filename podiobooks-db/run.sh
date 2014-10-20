sudo docker run -d --name="podiobooks-db" \
	-p 127.0.0.1:65432:5432 \
	--volumes-from podiobooks-data \
	podiobooks/podiobooks-db
