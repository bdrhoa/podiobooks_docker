#!/bin/bash
/usr/pgsql-9.3/bin/initdb -D /opt/podiobooks/data/db
/usr/pgsql-9.3/bin/pg_ctl start -D /opt/podiobooks/data/db/
sleep 5
psql --command "CREATE USER podiobooks WITH SUPERUSER PASSWORD 'podiobooks';"
createdb -O podiobooks podiobooks

echo "host all  all    0.0.0.0/0  md5" >> /opt/podiobooks/data/db/pg_hba.conf
echo "listen_addresses='*'" >> /opt/podiobooks/data/db/postgresql.conf

/usr/pgsql-9.3/bin/pg_ctl stop -D /opt/podiobooks/data/db/
