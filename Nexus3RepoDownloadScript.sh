#!/bin/bash

# Define variables from command-line arguments
SERVER_URL=$1
REPOSITORY=$2

# Function to display usage information
show_usage() {
    echo "[ERROR] Missing server URL or repository name."
    echo "Usage: $0 <server_url> <repository_name>"
    echo "Example: $0 http://nexus.example.com:8081 my-maven-repo"
    exit 1
}

# Check if the required parameters are provided
if [[ -z $SERVER_URL || -z $REPOSITORY ]]; then
    show_usage
fi

# Verify that lftp is installed
if ! command -v lftp &> /dev/null; then
    echo "[ERROR] lftp is not installed."
    echo "Please install lftp and rerun the script."
    echo "On CentOS: sudo yum install lftp"
    echo "For other Linux distributions, find the appropriate command."
    exit 2
fi

# Construct the full URL for the repository
REPO_URL="${SERVER_URL}/service/rest/repository/browse/${REPOSITORY}"

# Create a directory for the repository and change to that directory
mkdir -p repo && cd repo

# Mirror the repository structure to the current directory
lftp $REPO_URL -e 'mirror .; exit'

# Identify empty directories (directories without subdirectories)
EMPTY_DIRS=""
for dir in $(find . -type d); do
    if [[ -z $(ls -A "$dir") ]]; then
        EMPTY_DIRS+="${dir#./} "
    fi
done

# Download files from empty directories
for dir in $EMPTY_DIRS; do
    FILES=$(lftp $REPO_URL -e "ls $dir; exit" | awk '{print $3}' | grep -v '\.\.')
    if [[ -n $FILES ]]; then
        for file in $FILES; do
            lftp $REPO_URL -e "mget -d $file; exit"
        done
    fi
done

echo "[INFO] Successfully downloaded all artifacts from $SERVER_URL repository $REPOSITORY"
