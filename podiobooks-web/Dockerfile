FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@cyface.com"

USER root

# Update the OS
RUN yum update && yum upgrade -y --nogpgcheck

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

# Add nginx to user  group
RUN usermod -G podiobooks nginx

# Switch to user
USER podiobooks

# Add Supervisor Config File
ADD supervisord.conf /opt/podiobooks/supervisord.conf

# Add initial setup file
ADD podiobooks-initial-setup.sh /opt/podiobooks/podiobooks-initial-setup.sh

# Switch to root to run supervisord
USER root

# Expose Web Port
EXPOSE 80

CMD ["supervisord", "-n", "-c", "/opt/podiobooks/data/supervisord.conf"]
