FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@podiobooks.com"

# Update the OS
RUN yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

USER podiobooks

# Add setup script
ADD podiobooks-bu.sh /home/podiobooks/podiobooks-bu.sh

CMD ["/home/podiobooks/podiobooks-bu.sh"]
