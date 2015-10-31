FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@cyface.com"

USER root

# Update the OS
RUN yum update && yum upgrade -y --nogpgcheck

# Install Development Tools & OpenSSL
RUN yum install -y python-devel libxml2-devel pcre-devel jansson-devel libcap-devel uuid-devel sqlite-devel \
    openldap-devel libyaml-devel make openssl-devel openssl

# Install Pillow Pre-Requisites
RUN yum install -y libjpeg libjpeg-devel zlib zlib-devel libtiff libtiff-devel libfreetype libfreetype-devel \
    littlecms littlecms-devel libwebp libwebp-devel openjpeg openjpeg-devel

# Install Python 2.7.10
RUN yum install -y wget \
    && wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz \
    && tar -xf Python-2.7.10.tgz \
    && cd Python-2.7.10 \
    && ./configure --prefix /usr/local \
    && make altinstall

# Install pip
RUN wget https://bootstrap.pypa.io/get-pip.py \
 && /usr/local/bin/python2.7 ./get-pip.py

# Install uWSGI
RUN /usr/local/bin/pip install uwsgi

# Install Psycopg2
RUN /usr/local/bin/pip install psycopg2

# Install virtualenv
RUN /usr/local/bin/pip install virtualenv

# Add nginx official repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

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

# Auto-CD to Podiobooks Dir
RUN echo "cd /opt/podiobooks/data/" >> /root/.bash_profile

# Expose Web Port
EXPOSE 80

CMD ["supervisord", "-n", "-c", "/opt/podiobooks/data/supervisord.conf"]
