#!/usr/bin/env bash
# This file runs everything to set up a single server, rather than individual Docker containers.
# This assumes CentOS 7.1 as the base

# Start with this: git clone git@github.com:podiobooks/podiobooks_docker.git

## OS

# Add repos for specialty items
cp podiobooks-centos-base/epel.repo /etc/yum.repos.d/epel.repo
cp podiobooks-centos-base/postgresql.repo /etc/yum.repos.d/postgresql.repo
cp podiobooks-centos-base/CentOS-fasttrack.repo /etc/yum.repos.d/CentOS-fasttrack.repo

# Update centos
yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

# Install compiler
yum install -y gcc 

# Install Sudo
yum install -y sudo

# Install & Upgrade pip
yum install -y --nogpgcheck python-pip
pip install --upgrade pip

# Install Postgres Client
yum install -y --disablerepo=* --enablerepo=postgresql postgresql-devel
ln -s /usr/pgsql-9.3/bin/pg_config /usr/local/bin/pg_config

# Install git
yum install -y git

# Install supervisor
pip install supervisor

# Create podiobooks user
useradd -u 451 podiobooks -c "Podiobooks User"
echo 'podiobooks ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create Podiobooks Directory
mkdir /opt/podiobooks
mkdir /opt/podiobooks/data


## Postgres

# Install Prereqs
yum install -y libxslt uuid

# Install PostgreSQL
yum install -y postgresql-server postgresql-libs postgresql-contrib postgresql-devel --disablerepo=* --enablerepo=postgresql

# Add Postgres User to podiobooks Group
usermod -G podiobooks postgres

# Add postgres init file
cp podiobooks-db/postgres-initial-setup.sh /opt/podiobooks/postgres-initial-setup.sh
chown postgres.postgres /opt/podiobooks/postgres-initial-setup.sh

## Redis
yum install -y --nogpgcheck redis

# Add redis User to podiobooks Group
usermod -G podiobooks redis

# Copy redis config for local editing
cp /etc/redis.conf /opt/podiobooks/data/redis.conf


## Varnish
yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

# Install Varnish
rpm --nosignature -i https://repo.varnish-cache.org/redhat/varnish-4.1.el7.rpm
yum install -y --nogpgcheck varnish

# Add Vanish User to podiobooks Group
usermod -G podiobooks varnish


## Web

# Install Development Tools & OpenSSL
yum install -y python-devel libxml2-devel pcre-devel jansson-devel libcap-devel uuid-devel sqlite-devel \
    openldap-devel libyaml-devel make openssl-devel openssl

# Install Pillow Pre-Requisites
yum install -y libjpeg libjpeg-devel zlib zlib-devel libtiff libtiff-devel libfreetype libfreetype-devel \
    littlecms littlecms-devel libwebp libwebp-devel openjpeg openjpeg-devel

# Install Python 2.7.10
yum install -y wget \
    && wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz \
    && tar -xf Python-2.7.10.tgz \
    && cd Python-2.7.10 \
    && ./configure --prefix /usr/local \
    && make altinstall

# Install pip
wget https://bootstrap.pypa.io/get-pip.py \
 && /usr/local/bin/python2.7 ./get-pip.py

# Install virtualenv
/usr/local/bin/pip install virtualenv

# Add nginx official repository
cp podiobooks-web/nginx.repo /etc/yum.repos.d/nginx.repo

# Install nginx
yum install -y --disablerepo=* --enablerepo=nginx nginx

# Add nginx to user  group
usermod -G podiobooks nginx

# Add Supervisor Config File
cp podiobooks-web/supervisord.conf /opt/podiobooks/supervisord.conf

# Add initial setup file
cp podiobooks-web/podiobooks-initial-setup.sh /opt/podiobooks/podiobooks-initial-setup.sh

# Final Permissions Check
chown -R podiobooks.podiobooks /opt/podiobooks
chmod -R g+rwx /opt/podiobooks

# Run /opt/podiobooks/postgres-initial-setup.sh
# Run /opt/podiobooks/podiobooks-initial-setup.sh
# A) Make note of the SSH key you saw output from step 4.
# E) Go to GitHub.com/podiobooks in your web browser
# F) Log in as podiobooks
# G) Go to settings
# H) Go to SSH Keys
# I) Add Key
# J) Name it "Docker <x>"
# K) Paste in the ssh key you copied.
# L) Save

# Run /opt/podiobooks/data/podiobooks/devscripts/docker/podiobooks_get_alldata.sh
# Run /opt/podiobooks/data/podiobooks/devscripts/docker/podiobooks_get_dep.sh