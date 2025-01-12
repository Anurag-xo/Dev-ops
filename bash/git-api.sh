#!/bin/bash

#####################################
# Author/owner: Anurag-xo
# Date: 13/01/2025
# Version: v1
#####################################

###################################################################################################
# About: The script fetches the list of collaborators for a given GitHub repository
# Configuration
# API_URL: The base URL for the GitHub API.

# USERNAME: The GitHub username (passed as a variable $username).

# TOKEN: The GitHub Personal Access Token (PAT) for authentication (passed as a variable $token).

# REPO_OWNER: The owner of the repository (passed as the first argument $1).

# REPO_NAME: The name of the repository (passed as the second argument $2).


# Also install jq
#######################################################################################################

API_URL="https://api.github.com"

# Github username and PAT(personal access token)
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

 # Function to mae GET request to the Github API
 function github_api_get {
   local endpoint="$1"
   local url="${API_URL}/${endpoint}"

   # Send GET request to GITHUB API with authentication
   curl -s -u "${USERNAME}:${TOKEN}" "$url"
 }
 # Function to list useres with read acces to the Repository
function list_users_with_read_access {
  local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

  # Fetch the list of collaborators on the Repository
  github_api_getgitgithub_api_get "endpoint" | jq -r '.[] | select(.permissions.pull == true | .login') 

  # Display the list of collaborators with read access
  if [[ -z "$collaborators" ]]; then
    echo "No user with read acces found for ${REPO_OWNER}/${REPO_NAME}."
  else
    echo "Users with read access ${REPO_OWNER}/${REPO_NAME}:"
    echo "$collaborators"
  fi
}

# Main script
echo "Listening users with read acces to ${REPO_OWNER}/${REPO_NAME}...."
list_users_with_read_access

