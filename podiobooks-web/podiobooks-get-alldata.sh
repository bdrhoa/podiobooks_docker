echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/podiobooks/.ssh/config
ssh-agent bash -c 'ssh-add /home/podiobooks/data/.ssh/id_rsa; git clone git@github.com:podiobooks/podiobooks_data.git /home/podiobooks/data/podiobooks_data'
cd /home/podiobooks/data/podiobooks
. .env/bin/activate
python manage.py loaddata /home/podiobooks/data/podiobooks_data/alldata.json.zip
