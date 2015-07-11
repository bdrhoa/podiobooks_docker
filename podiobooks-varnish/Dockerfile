FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@podiobooks.com"

# Update OS
RUN yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

# Install Varnish
RUN rpm --nosignature -i https://repo.varnish-cache.org/redhat/varnish-4.0.el6.rpm
RUN yum install -y --nogpgcheck varnish

# Add Vanish User to podiobooks Group
RUN usermod -G podiobooks varnish

# Expose Ports
EXPOSE 6081

# Start uWSGI
CMD ["/usr/bin/varnishd -f /etc/varnish/default.vcl -s malloc,100M -a 0.0.0.0:${VARNISH_PORT}"]
