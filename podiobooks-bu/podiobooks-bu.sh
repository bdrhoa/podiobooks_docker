#!/bin/bash
mkdir /home/podiobooks/.ssh/
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/podiobooks/.ssh/config
ssh-agent bash -c 'ssh-add /home/podiobooks/data/.ssh/id_rsa; git clone --depth=1 git@github.com:podiobooks/podiobooks_data.git /home/podiobooks/data/podiobooks_data'
cd /home/podiobooks/data/podiobooks
. .env/bin/activate
python manage.py dumpdata podiobooks_app > /home/podiobooks/data/podiobooks_data/alldata.json
gzip --quiet --force /home/podiobooks/data/podiobooks_data/alldata.json
cd /home/podiobooks/data/podiobooks_data
git add *
git config user.email "tim@podiobooks.com"
git config user.name "podiobooks BU"
git config push.default simple
git commit -am "Backup"
ssh-agent bash -c 'ssh-add /home/podiobooks/data/.ssh/id_rsa; git push'