#!/bin/bash

set -e

BUILD_UTIL_DIR="."
SCRIPTS_DIR="$BUILD_UTIL_DIR/.scripts"
SCRIPTS_FILE="build-main.sh"

SCRIPTS_REPO="https://github.com/wgbdev/build-scripts.git"

if ! [ -d $SCRIPTS_DIR ]; then

	if ! [ -f "$SCRIPTS_FILE" ]; then

		# source export these files
		echo "No prior $SCRIPTS_DIR directory was found, pulling and calling $SCRIPTS_DIR/$SCRIPTS_FILE"
		git clone -q "$SCRIPTS_REPO" $SCRIPTS_DIR
		echo
	else
		echo "We are running this utility within the $SCRIPTS_DIR directory."

		SCRIPTS_DIR="."
	fi
else

	echo "Checking for latest version of scripts..."

	cd "$SCRIPTS_DIR"
	git pull -q
	retval=$?

	#echo "retval=[$retval]"
	###if [ "$retval" -eq 0 ]; then
	###	cp batch.sh ../xx-batch.sh
	###fi
	cd ../..
fi
echo

./"$SCRIPTS_DIR/$SCRIPTS_FILE" "$@"

