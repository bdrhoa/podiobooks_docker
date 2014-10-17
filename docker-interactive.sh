#!/bin/bash
sudo docker run --rm --volumes-from podiobooks-data -it podiobooks/podiobooks-centos-base /bin/bash
