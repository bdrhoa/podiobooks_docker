#!/bin/bash
mkdir /opt/podiobooks/.ssh/
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /opt/podiobooks/.ssh/config
ssh-agent bash -c 'ssh-add /opt/podiobooks/data/.ssh/id_rsa; git clone --depth=1 git@github.com:podiobooks/podiobooks_data.git /opt/podiobooks/data/podiobooks_data'
cd //podiobooks/data/podiobooks
. .env/bin/activate
python manage.py dumpdata podiobooks_app > /opt/podiobooks/data/podiobooks_data/alldata.json
gzip --quiet --force /opt/podiobooks/data/podiobooks_data/alldata.json
cd /opt/podiobooks/data/podiobooks_data
git add *
git config user.email "tim@podiobooks.com"
git config user.name "podiobooks BU"
git config push.default simple
git commit -am "Backup"
ssh-agent bash -c 'ssh-add /opt/podiobooks/data/.ssh/id_rsa; git push'
