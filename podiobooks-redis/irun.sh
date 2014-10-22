sudo docker run -it \
	--volumes-from podiobooks-data \
	--link podiobooks-redis:redis \
	podiobooks/podiobooks-redis /bin/bash
