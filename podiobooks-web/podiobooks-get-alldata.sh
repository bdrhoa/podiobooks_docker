#!/bin/bash
# Note this will only work if you have set up an ssh key in /home/podiobooks/data/.ssh and added it to the podiobooks_data deploy keys
# The podiobooks-initial-setup.sh should create the key for you, but you have toadd it in the github interface as the podiobooks user in github.
mkdir /home/podiobooks/.ssh
chmod 700 /home/podiobooks/.ssh
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/podiobooks/.ssh/config
chmod 600 /home/podiobooks/.ssh/config
ssh-agent bash -c 'ssh-add /home/podiobooks/data/.ssh/id_rsa; git clone --depth=1 git@github.com:podiobooks/podiobooks_data.git /home/podiobooks/data/podiobooks_data'
cd /home/podiobooks/data/podiobooks
. .env/bin/activate
python manage.py loaddata /home/podiobooks/data/podiobooks_data/alldata.json.zip
