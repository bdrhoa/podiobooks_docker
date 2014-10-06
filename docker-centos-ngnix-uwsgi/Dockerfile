FROM centos:latest

MAINTAINER Podiobooks Dev Team "podiobooksdev@gmail.com"

# Add nginx official repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Add repos for other items
ADD epel.repo /etc/yum.repos.d/epel.repo
ADD CentOS-fasttrack.repo /etc/yum.repos.d/CentOS-fasttrack.repo

# Update centos
RUN yum update -y

# Install nginx
RUN yum install -y nginx
RUN rm /etc/nginx/conf.d/*

# Install pip
RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python

# Install uwsgi
RUN yum install -y gcc 
RUN yum install -y python-devel libxml2-devel pcre-devel jansson-devel libcap-devel uuid-devel sqlite-devel openldap-devel libyaml-devel
RUN pip install uwsgi

# Install git
RUN yum install -y git

# Turn off Daemon of nginx so that it can be managed by Docker
RUN echo -e "\ndaemon off;" >> /etc/nginx/nginx.conf

# Add uwsgi setup to nginx
ADD uwsgi-nginx.conf /etc/nginx/conf.d/uwsgi-nginx.conf

# Working dir
WORKDIR /etc/nginx

# Expose Ports
EXPOSE 80
EXPOSE 443

# Default Command
#CMD ["nginx"]
