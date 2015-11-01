Here's how to get this all up and going with Docker.

The "install.sh" script in this directory should do steps 1-4 for you.

0) Build all your images by going into each subfolder and running the 'build.sh' script in there. (Or run build-all.sh in this dir).

1) Get your data container going by running the 'run.sh' in the podiobooks-data folder.  That will create a container, but it immediately quits.  That's OK, it doesn't need to stay running to hold it's volumes open.

2) Set up the DB container by running 'run-init.sh' in the podiobooks-db folder. That will start up the PostgreSQL server just long enough to set up the configs, and then quit.

3) Fire up the DB by running 'run.sh' in the podiobooks-db folder, this will start up the database to run as a docker daemon.

4) Set up the web by doing the 'run-init.sh' script in the podiobooks-web folder - this will check out the code, etc.  Keep your shell window open after running this!

5)
    A) Make note of the SSH key you saw output from step 4.
    E) Go to GitHub.com/podiobooks in your web browser
    F) Log in as podiobooks
    G) Go to podiobooks/podiobooks_docker
    H) Go to settings
    I) Go to Deploy Keys
    J) Add Key
    K) Name it "Docker <x>"
    L) Paste in the ssh key you copied.
    M) Save

6) Open a shell window to this dir and run:
   ./podiobooks-web/podiobooks-get-alldata.sh
   This will install the alldata package.

7) You can use the docker-interactive-shell.sh or the irun.sh scripts to get into a container that will let you take a look at the /opt/podiobooks/data dir which has all logs - you can also use it to pull code updates, export backups, etc.

Enjoy !


