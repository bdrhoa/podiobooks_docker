#!/bin/bash
#if [ -d /home/podiobooks/data/podiobooks ]; then 
#	rm -rf /home/podiobooks/data/podiobooks
#fi
git clone https://github.com/podiobooks/podiobooks.git /home/podiobooks/data/podiobooks
cd /home/podiobooks/data/podiobooks
./devscripts/virtualenv/setup_prod_env.sh
. .env/bin/activate
python manage.py collectstatic --noinput
cp /home/podiobooks/local_settings.py /home/podiobooks/data/podiobooks/podiobooks/local_settings.py
chown -R podiobooks.podiobooks /home/podiobooks/data/podiobooks
