#!/bin/bash

# NOTE: For this to work properly,you need to add .scripts/ and .env-settings 
#.      to your .gitignore file

set -e

SCRIPTS_DIR=".scripts/"
SCRIPTS_REPO="https://github.com/wgbdev/build-scripts.git"

if ! [ -d .scripts ]; then
	if ! [ -f build-main.sh ]; then
		# source export these files
		echo "No prior .scripts directory was found, pulling and calling .scripts/build-main.sh"
		git clone -q "$SCRIPTS_REPO" .scripts
		echo
	else
		SCRIPTS_DIR=""
	fi
else

	echo "Checking for latest version of scripts..."

	cd "$SCRIPTS_DIR"
	git pull
	retval=$?

	#echo "retval=[$retval]"
	###if [ "$retval" -eq 0 ]; then
	###	cp batch.sh ../xx-batch.sh
	###fi
	cd ..
fi
echo

./"$SCRIPTS_DIR"build-main.sh "$@"

