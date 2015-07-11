FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@podiobooks.com"

# Install Varnish
RUN rpm --nosignature -i https://repo.varnish-cache.org/redhat/varnish-4.0.el6.rpm
RUN yum install varnish

# Add Vanish User to podiobooks Group
RUN usermod -G podiobooks varnish

# Expose Ports
EXPOSE 6081

# Start uWSGI
CMD ["/usr/bin/varnish"]
