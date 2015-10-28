Here's how to get this all up and going with Docker.

0) Build all your images by going into each subfolder and running the 'build.sh' script in there.

1) Get your data container going by running the 'run.sh' in the podiobooks-data folder.  That will create a container, but it immediately quits.  That's OK, it doesn't need to stay running to hold it's volumes open.

2) Set up the DB container by running 'run-init.sh' in the podiobooks-db folder. That will start up the PostgreSQL server just long enough to set up the configs, and then quit.

3) Fire up the DB by running 'run.sh' in the podiobooks-db folder, this will start up the database to run as a docker daemon.

4) Set up the web by doing the 'run-init.sh' script in the podiobooks-web folder - this will check out the code, etc.

5) Use the 'irun.sh' to go into a temp copy of the podiobooks-web container and then:
   A) su - podiobooks
   B) cd /opt/podiobooks/data/podiobooks
   C) ./podiobooks-initial-setup.sh
   D) Copy the ssh key that it generates, keep ssh window open
   E) Go to GitHub.com/podiobooks in your web browser
   F) Log in as podiobooks
   G) Go to podiobooks/podiobooks_docker
   H) Go to settings
   I) Go to Deploy Keys
   J) Add Key
   K) Name it "Docker <x>"
   L) Paste in the ssh key you copied.
   M) Save
   N) Go back to the shell window
   O) ./podiobooks-get-alldata.sh
   P) exit

6) Fire up the web tier with 'run.sh' int he podiobooks-web folder.

7) You can use the docker-interactive-shell.sh or the irun.sh scripts to get into a container that will let you take a look at the /opt/podiobooks/data dir which has all logs - you can also use it to pull code updates, export backups, etc.

Enjoy !


