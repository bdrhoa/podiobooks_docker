FROM cyface/podiobooks-centos-base

MAINTAINER Tim L. White "tim@cyface.com"

USER podiobooks

# Make a directory to use
RUN mkdir /home/podiobooks/data

#RUN chown printsat.printsat /home/podiobooks/data
RUN chmod g+rwx /home/podiobooks/data

# Expose Volume for Cther Containers to Grab Onto
VOLUME ["/home/podiobooks/data"]

CMD ["/bin/bash"]

