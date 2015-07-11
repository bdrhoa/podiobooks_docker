FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@podiobooks.com"

# Update the OS
RUN yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

# Install Redis
RUN yum install -y --nogpgcheck redis 

# Add redis User to podiobooks Group
RUN usermod -G podiobooks redis

# Expose Ports
EXPOSE 6379

# Start uWSGI
CMD ["/usr/bin/redis-server"]
