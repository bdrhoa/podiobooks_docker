FROM centos:latest

MAINTAINER Tim L. White "tim@cyface.com"

# Add repos for other items
ADD epel.repo /etc/yum.repos.d/epel.repo
ADD postgresql.repo /etc/yum.repos.d/postgresql.repo
ADD CentOS-fasttrack.repo /etc/yum.repos.d/CentOS-fasttrack.repo

# Update centos
RUN yum update -y --nogpgcheck && yum upgrade -y --nogpgcheck

# Install compiler
RUN yum install -y gcc 

# Install Sudo
RUN yum install -y sudo

# Install & Upgrade pip
RUN yum install -y --nogpgcheck python-pip
RUN pip install --upgrade pip

# Install Postgres Client
RUN yum install -y --disablerepo=* --enablerepo=postgresql postgresql-devel
RUN ln -s /usr/pgsql-9.3/bin/pg_config /usr/local/bin/pg_config

# Install git
RUN yum install -y git

# Install supervisor
RUN pip install supervisor

# Create podiobooks user
RUN useradd -u 451 podiobooks -c "Podiobooks User"
RUN echo 'podiobooks ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create Podiobooks Directory
RUN mkdir /opt/podiobooks
RUN chown -R podiobooks.podiobooks /opt/podiobooks
RUN chmod -R g+rwx /opt/podiobooks

# Default Command
CMD ["/bin/bash"]
