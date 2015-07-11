sudo docker run -it \
	--volumes-from podiobooks-data \
	--link podiobooks-varnish:varnish \
	podiobooks/podiobooks-varnish /bin/bash
