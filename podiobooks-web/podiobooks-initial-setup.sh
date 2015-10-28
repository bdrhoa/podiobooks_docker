#!/bin/bash
cp /opt/podiobooks/podiobooks-nginx.conf /opt/podiobooks/data/podiobooks-nginx.conf
cp /opt/podiobooks/podiobooks-uwsgi.xml /opt/podiobooks/data/podiobooks-uwsgi.xml
cp /opt/podiobooks/supervisord.conf /opt/podiobooks/data/supervisord.conf
cp /etc/nginx/uwsgi_params /opt/podiobooks/data/uwsgi_params
git clone --depth=1 https://github.com/podiobooks/podiobooks.git /opt/podiobooks/data/podiobooks
cd /opt/podiobooks/data/podiobooks
./devscripts/virtualenv/setup_prod_env.sh
. .env/bin/activate
pip install psycopg2
python manage.py collectstatic --noinput
cp /opt/podiobooks/settings_local.py /opt/podiobooks/data/podiobooks/podiobooks/settings_local.py
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
