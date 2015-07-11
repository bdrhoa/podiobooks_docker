FROM podiobooks/podiobooks-centos-base

MAINTAINER Tim L. White "tim@podiobooks.com"

# Update the OS
RUN yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

USER podiobooks

# Make a directory to use
RUN mkdir /home/podiobooks/data

#RUN chown podiobooks.podiobooks /home/podiobooks/data
RUN chmod g+rwx /home/podiobooks/data

# Expose Volume for Cther Containers to Grab Onto
VOLUME ["/home/podiobooks/data"]

CMD ["/bin/bash"]

