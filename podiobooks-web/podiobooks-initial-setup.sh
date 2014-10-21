#!/bin/bash
#if [ -d /home/podiobooks/data/podiobooks ]; then 
#	rm -rf /home/podiobooks/data/podiobooks
#fi
git clone --depth=1 https://github.com/podiobooks/podiobooks.git /home/podiobooks/data/podiobooks
cd /home/podiobooks/data/podiobooks
./devscripts/virtualenv/setup_prod_env.sh
. .env/bin/activate
pip install psycopg2
python manage.py collectstatic --noinput
cp /home/podiobooks/settings_local.py /home/podiobooks/data/podiobooks/podiobooks/settings_local.py
chown -R podiobooks.podiobooks /home/podiobooks/data/podiobooks
