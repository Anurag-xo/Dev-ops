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

# Dependencies: Install jq (sudo apt install jq)
#######################################################################################################

API_URL="https://api.github.com"

# GitHub username and PAT (personal access token)
USERNAME="your_github_username"  # Replace with your GitHub username or pass as an environment variable
TOKEN="your_personal_access_token"  # Replace with your GitHub PAT or pass as an environment variable

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make GET request to the GitHub API
function github_api_get {
  local endpoint="$1"
  local url="${API_URL}/${endpoint}"

  # Send GET request to GitHub API with authentication
  curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
  local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

  # Fetch the list of collaborators on the repository
  collaborators=$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')

  # Display the list of collaborators with read access
  if [[ -z "$collaborators" ]]; then
    echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
  else
    echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
    echo "$collaborators"
  fi
}

# Main script
if [[ -z "$REPO_OWNER" || -z "$REPO_NAME" ]]; then
  echo "Usage: $0 <repo_owner> <repo_name>"
  exit 1
fi

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
