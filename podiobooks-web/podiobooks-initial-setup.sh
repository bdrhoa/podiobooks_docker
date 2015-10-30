#!/bin/bash
cp /opt/podiobooks/supervisord.conf /opt/podiobooks/data/supervisord.conf
cp /etc/nginx/uwsgi_params /opt/podiobooks/data/uwsgi_params
git clone --depth=1 https://github.com/podiobooks/podiobooks.git /opt/podiobooks/data/podiobooks
cd /opt/podiobooks/data/podiobooks
./devscripts/docker/setup_docker_env.sh
. .env/bin/activate
python manage.py collectstatic --noinput
chown -R podiobooks.podiobooks /opt/podiobooks/data/podiobooks
python manage.py migrate --noinput
cd /opt/podiobooks/data
mkdir .ssh
chmod 700 .ssh
cd .ssh
ssh-keygen -t rsa -b 4096 -q -N "" -f id_rsa 
cat id_rsa.pub
cd ..
chown -R podiobooks.podiobooks .ssh
echo "Create a new Deploy Key for podiobooks_data with the Public Key above"
