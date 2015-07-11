cp /home/podiobooks/podiobooks-nginx.conf /home/podiobooks/data/podiobooks-nginx.conf
cp /home/podiobooks/podiobooks-uwsgi.conf /home/podiobooks/data/podiobooks-uwsgi.conf
git clone --depth=1 https://github.com/podiobooks/podiobooks.git /home/podiobooks/data/podiobooks
cd /home/podiobooks/data/podiobooks
./devscripts/virtualenv/setup_prod_env.sh
. .env/bin/activate
pip install psycopg2
python manage.py collectstatic --noinput
cp /home/podiobooks/settings_local.py /home/podiobooks/data/podiobooks/podiobooks/settings_local.py
chown -R podiobooks.podiobooks /home/podiobooks/data/podiobooks
python manage.py migrate --noinput
cd /home/podiobooks/data
mkdir .ssh
chmod 700 .ssh
cd .ssh
ssh-keygen -t rsa -b 4096 -q -N "" -f id_rsa 
cat id_rsa.pub
echo "Create a new Deploy Key for podiobooks_data with the Public Key above"
