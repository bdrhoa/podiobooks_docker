FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@podiobooks.com"

# Update the OS
RUN yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

# Install Redis
RUN yum install -y --nogpgcheck redis 

# Add redis User to podiobooks Group
RUN usermod -G podiobooks redis

RUN cp /etc/redis.conf /opt/podiobooks/data/redis.conf

# Expose Ports
EXPOSE 6379

# Start Redis
CMD ["/usr/bin/redis-server /opt/podiobooks/data/redis.conf"]
