# Nexus OSS Repository Migration Tools
# This repository contains a collection of Bash scripts designed to help you migrate your non-pro Nexus repositories from an old Nexus instance to a new Nexus instance.

# Table of Contents
# Scripts Overview
Nexus3RepoDownloadScript.sh
mavenRepoUploadScript.sh
npmRepoUploadScript.sh
nugetRepoUploadScript.sh

# Prerequisites
Usage
Cloning the Repository
Running the Scripts
Contributing
License

# Scripts Overview
Nexus3RepoDownloadScript.sh
This script is used to download a repository from an existing Nexus 3 instance to your local Linux server.

mavenRepoUploadScript.sh
This script facilitates the upload of a Maven repository to a new Nexus instance.

npmRepoUploadScript.sh
This script is designed to upload an NPM repository to a new Nexus instance.

nugetRepoUploadScript.sh
This script allows you to upload a NuGet repository to a new Nexus instance.

# Prerequisites
Before you begin, ensure that you have met the following requirements:

# LFTP: Required for the Nexus3RepoDownloadScript.sh. 
Install it using:
sudo yum install lftp -y

# Git: Ensure Git is installed on your system for cloning this repository.

# Usage
Cloning the Repository
To get started, clone this repository to server:
git clone https://github.com/oseghalep/nexus-migration-tools.git

Navigate to the root directory of the repository:
cd nexus-migration-tools

# Running the Scripts
1. Downloading a Repository
Use the Nexus3RepoDownloadScript.sh to download a repository from an old Nexus instance:
  /path/to/Nexus3RepoDownloadScript.sh http://<old_nexus_url>:8081 <repo_name>
Replace <old_nexus_url> with your Nexus instance URL and <repo_name> with the name of the repository you wish to download.

2. Uploading a Maven Repository
   Use the mavenRepoUploadScript.sh to upload a Maven repository to the new Nexus instance:
/path/to/mavenRepoUploadScript.sh -u <username> -p <password> -r http://<new_nexus_url>:8081/repository/maven-releases/
Replace <username>, <password>, and <new_nexus_url> with your credentials and the URL of the new Nexus instance.

3. Uploading an NPM Repository
Use the npmRepoUploadScript.sh to upload an NPM repository:
/path/to/npmRepoUploadScript.sh -k <api_key_from_nexus> -r http://<new_nexus_url>:8081/repository/npm-hosted/
Replace <api_key_from_nexus> and <new_nexus_url> with your API key and the URL of the new Nexus instance.

4. Uploading a NuGet Repository
Use the nugetRepoUploadScript.sh to upload a NuGet repository:
/path/to/nugetRepoUploadScript.sh -r http://<new_nexus_url>:8081/repository/nuget-hosted/
Replace <new_nexus_url> with the URL of the new Nexus instance.

Contributing
Contributions are welcome! If you have suggestions for improvements or new features, feel free to submit a pull request or open an issue.
