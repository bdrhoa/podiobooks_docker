sudo docker run --rm -it \
	--volumes-from podiobooks-data \
	--link podiobooks-db:db \
	podiobooks/podiobooks-web /bin/bash
