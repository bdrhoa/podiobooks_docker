FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@podiobooks.com"

# Update the OS
RUN yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

USER podiobooks

# Make a directory to use
RUN mkdir /opt/podiobooks/data

#RUN chown podiobooks.podiobooks /opt/podiobooks/data
RUN chmod g+rwx /opt/podiobooks/data

# Expose Volume for Cther Containers to Grab Onto
VOLUME ["/opt/podiobooks/data"]

CMD ["/bin/bash"]

