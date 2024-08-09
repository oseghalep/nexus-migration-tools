#!/bin/bash

# Clone this file to the root directory of the repo you want to copy 
while getopts ":a:b:c:" option; do
	case $option in
		a) SERVER_URL="$OPTARG"
		;;
		b) USER_NAME="$OPTARG"
		;;
		c) USER_KEY="$OPTARG"
		;;
	esac
done

# Locate files and exclude specific paths/patterns from being uploaded
find . -type f \
    -not -path './mavenRepoUploadScript.sh*' \
    -not -path '*/\.*' \
    -not -path '*/\^archetype-c atalog\.xml*' \
    -not -path '*/\^maven-metadata-local*\.xml' \
    -not -path '*/\^maven-metadata-deployment*\.xml' | \
sed "s|^\./||" | \
xargs -I '{}' curl -u "$USER_NAME:$USER_KEY" -X PUT -v -T '{}' ${SERVER_URL}/'{}' ;
