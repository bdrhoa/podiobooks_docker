#!/usr/bin/env bash
# Copy files into our working directory so we can edit them if we need to
cp /opt/podiobooks/supervisord.conf /opt/podiobooks/data/supervisord.conf
cp /etc/nginx/uwsgi_params /opt/podiobooks/data/uwsgi_params

# Clone the Podiobooks Git Repo
git clone --depth=1 https://github.com/podiobooks/podiobooks.git /opt/podiobooks/data/podiobooks

# Link the config files for dev, we can change to staging/prod later by moving symlink
ln -s /opt/podiobooks/data/podiobooks/devscripts/docker/podiobooks-nginx.conf /opt/podiobooks/data/podiobooks-nginx.conf

# Install VirtualEnv
cd /opt/podiobooks/data/podiobooks
./devscripts/docker/setup_docker_env.sh
. .env/bin/activate

# Initialize the Django DB
python manage.py migrate --noinput

# Collect the Static Files
python manage.py collectstatic --noinput

# Make sure permissions are correct
chown -R podiobooks.podiobooks /opt/podiobooks/data/podiobooks

# Set up an SSH Key for future use during backups
cd /opt/podiobooks/data
mkdir .ssh
chmod 700 .ssh
cd .ssh
ssh-keygen -t rsa -b 4096 -q -N "" -f id_rsa 
cat id_rsa.pub
cd ..
chown -R podiobooks.podiobooks .ssh
echo "Create a new Deploy Key for podiobooks_data with the Public Key above"
