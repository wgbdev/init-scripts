# init-scripts

This is used to pull down all the other scripts to initialize a repo to use this standard
build platform.

Easiest use is to do the follow:

Change in a previously git init directory and run the following command:

curl -fsSL "https://raw.githubusercontent.com/wgbdev/init-scripts/main/build-util.sh" > build-util.sh

# Optional to make it runnable 
chmod +x build-util.sh

# Run from bash
/bin/bash build-util.sh

This will pull down a very simple script that will then execute and setup a basic bootstrapping 
ability to pull the rest of the scripts down.  To be able to run the newly created build-util.sh
script, you will need private access to the wgbdev/build-scripts.git repo, otherwise this script
creates a few useless files for you and sets of a few directories.

