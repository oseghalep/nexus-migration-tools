#!/bin/bash

# Get command line params
while getopts ":u:a:" opt; do
    case $opt in
        u) URL="$OPTARG" ;;     # Repository URL
        a) KEY="$OPTARG" ;;     # API Key
        *) 
            echo "Usage: $0 -u <repo_url> -a <apikey>"
            exit 1 
            ;;
    esac
done

# Ensure URL and KEY are provided
if [ -z "$URL" ] || [ -z "$KEY" ]; then
    echo "Error: Both repository URL and API key are required."
    echo "Usage: $0 -u <repo_url> -a <apikey>"
    exit 1
fi

# Find .nupkg files and push to the repository
find . -type f -name '*.nupkg' -not -path '*/\.*' | while IFS= read -r file; do
    nuget push "$file" "$KEY" -Source "$URL"
done
