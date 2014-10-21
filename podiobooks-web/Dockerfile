FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@cyface.com"

USER root

# Install uwsgi
RUN yum install -y python-devel libxml2-devel pcre-devel jansson-devel libcap-devel uuid-devel sqlite-devel openldap-devel libyaml-devel
RUN pip install uwsgi

# Install Psycopg2
RUN pip install psycopg2

# Install Pillow
RUN yum install -y libjpeg libjpeg-devel zlib zlib-devel libtiff libtiff-devel libfreetype libfreetype-devel littlecms littlecms-devel libwebp libwebp-devel openjpeg openjpeg-devel

# Install virtualenv
RUN pip install virtualenv

# Add nginx official repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Install openssl
RUN yum install -y openssl-devel openssl

# Install nginx
RUN yum install -y --disablerepo=* --enablerepo=nginx nginx

# Turn off Daemon of nginx so that it can be managed by Docker
RUN echo -e "\ndaemon off;" >> /etc/nginx/nginx.conf

# Delete default nginx configs
RUN rm /etc/nginx/conf.d/* 

# Add Supervisor Config File
ADD supervisord.conf /etc/nginx/supervisord.conf

# Add nginx config
ADD podiobooks-nginx.conf /etc/nginx/conf.d/podiobooks-nginx.conf

# Add nginx to user  group
RUN usermod -G podiobooks nginx

# Switch to user
USER podiobooks

# Add local app settings file to temp location - init setup will install
ADD podiobooks_settings_local.py /home/podiobooks/settings_local.py

# Add initial dataload script - note, you have to init the DB first manually
ADD podiobooks-get-alldata.sh /home/podiobooks/podiobooks-get-alldata.sh

# Add initial setup file
ADD podiobooks-initial-setup.sh /home/podiobooks/podiobooks-initial-setup.sh

# Switch to root to run supervisord
USER root

# Expose Web Port
EXPOSE 80

CMD ["supervisord", "-n", "-c", "/etc/nginx/supervisord.conf"]

# Add Uwsgi File
ADD podiobooks-uwsgi.xml /home/podiobooks/podiobooks-uwsgi.xml
