sudo docker run --rm -it \
	-p 127.0.0.1:60080:80 \
	--volumes-from podiobooks-data \
	--link podiobooks-db:db \
	podiobooks/podiobooks-web /bin/bash
