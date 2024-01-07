#!/bin/bash

set -e

SCRIPTS_FILE="build-main.sh"
SCRIPTS_DIR=".build-util/scripts"

SCRIPTS_REPO="https://github.com/wgbdev/build-scripts.git"

if ! [ -d $BUILD_UTIL_DIR ]; then
	if ! [ -f build-main.sh ]; then
		# source export these files
		echo "No prior .scripts directory was found, pulling and calling $SCRIPTS_DIR/$SCRIPTS_FILE"
		git clone -q "$SCRIPTS_REPO" $SCRIPTS_DIR
		echo
	else
		echo "Se are running this utility within the $SCRIPTS_DIR directory."

		SCRIPTS_DIR="."
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
	cd ../..
fi
echo

./"$SCRIPTS_DIR/$SCRIPTS_FILE" "$@"

