sudo docker run --rm -i \
        --volumes-from podiobooks-data \
        --link podiobooks-db:db \
        --link podiobooks-redis:redis \
        podiobooks/podiobooks-web /opt/podiobooks/data/podiobooks/devscripts/docker/podiobooks_update.sh
