#!/bin/bash

# Script to create a new Criteria app from the template

# Default project name
DEFAULT_PROJECT_NAME="criteria-app"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Display banner
echo -e "${BLUE}"
echo " _________        .__  __               .__        "
echo " \_   ___ \_______|__|/  |_  ___________|__|____   "
echo " /    \  \/\_  __ \  \   __\/ __ \_  __ \  \__  \  "
echo " \     \____|  | \/  ||  | \  ___/|  | \/  |/ __ \_"
echo "  \______  /|__|  |__||__|  \___  >__|  |__(____  /"
echo "         \/                     \/              \/ "
echo -e "${NC}"
echo "Create a new Criteria app from the template"
echo ""

# Check if curl, jq and git are installed
command -v curl >/dev/null 2>&1 || { echo -e "${RED}Error: curl is not installed. Please install curl and try again.${NC}" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo -e "${RED}Error: jq is not installed. Please install jq and try again.${NC}" >&2; exit 1; }
command -v git >/dev/null 2>&1 || { echo -e "${RED}Error: git is not installed. Please install git and try again.${NC}" >&2; exit 1; }

# Get project name
if [ -z "$1" ]; then
  echo -n "Project name (default: $DEFAULT_PROJECT_NAME): "
  read PROJECT_NAME
  PROJECT_NAME=${PROJECT_NAME:-$DEFAULT_PROJECT_NAME}
else
  PROJECT_NAME=$1
fi

# Ask if user wants to create a GitHub repository
echo -n "Create GitHub repository? (y/N): "
read CREATE_GITHUB_REPO
CREATE_GITHUB_REPO=${CREATE_GITHUB_REPO:-n}

if [[ ${CREATE_GITHUB_REPO,,} == "y" ]]; then
  # Check for GitHub token
  if [ -z "$GITHUB_TOKEN" ]; then
    echo -e "${YELLOW}GitHub Personal Access Token not found in environment.${NC}"
    echo "You need a GitHub Personal Access Token with 'repo' scope."
    echo "Get one from https://github.com/settings/tokens"
    echo -n "Enter GitHub Personal Access Token: "
    read -s GITHUB_TOKEN
    echo ""
    
    if [ -z "$GITHUB_TOKEN" ]; then
      echo -e "${RED}No token provided. Continuing without GitHub repository creation.${NC}"
      CREATE_GITHUB_REPO="n"
    fi
  fi
  
  if [[ ${CREATE_GITHUB_REPO,,} == "y" ]]; then
    # Get GitHub username
    echo -n "GitHub username or organization: "
    read GITHUB_USERNAME
    
    if [ -z "$GITHUB_USERNAME" ]; then
      echo -e "${RED}No username provided. Continuing without GitHub repository creation.${NC}"
      CREATE_GITHUB_REPO="n"
    else
      # Ask for repo visibility
      echo -n "Make repository private? (y/N): "
      read REPO_PRIVATE
      REPO_PRIVATE=${REPO_PRIVATE:-n}
      
      if [[ ${REPO_PRIVATE,,} == "y" ]]; then
        PRIVATE=true
      else
        PRIVATE=false
      fi
      
      # Ask for repository description
      echo -n "Repository description (optional): "
      read REPO_DESCRIPTION
      
      # Creating GitHub repository
      echo -e "${BLUE}Creating GitHub repository ${GITHUB_USERNAME}/${PROJECT_NAME}...${NC}"
      
      # API call to create repository
      CREATE_REPO_RESPONSE=$(curl -s -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/user/repos \
        -d "{\"name\":\"$PROJECT_NAME\",\"private\":$PRIVATE,\"description\":\"$REPO_DESCRIPTION\"}")
      
      # Check if repository was created successfully
      if echo "$CREATE_REPO_RESPONSE" | grep -q "git@github.com"; then
        echo -e "${GREEN}GitHub repository created successfully!${NC}"
        REPO_URL=$(echo "$CREATE_REPO_RESPONSE" | jq -r .ssh_url)
      elif echo "$CREATE_REPO_RESPONSE" | grep -q "html_url"; then
        echo -e "${GREEN}GitHub repository created successfully!${NC}"
        REPO_URL=$(echo "$CREATE_REPO_RESPONSE" | jq -r .clone_url)
      else
        echo -e "${RED}Failed to create GitHub repository.${NC}"
        echo "Error: $(echo "$CREATE_REPO_RESPONSE" | jq -r .message)"
        CREATE_GITHUB_REPO="n"
      fi
    fi
  fi
fi

# Clone the repository
echo "Cloning the Criteria template..."
git clone --depth=1 https://github.com/criteria/nextjs-template.git $PROJECT_NAME
cd $PROJECT_NAME

# Remove git history
rm -rf .git

# Initialize a new git repository
git init

# Run setup script
echo -e "${GREEN}Setting up your new Criteria app...${NC}"
npm run setup $PROJECT_NAME

# If GitHub repository was created, push to it
if [[ ${CREATE_GITHUB_REPO,,} == "y" ]]; then
  echo -e "${BLUE}Pushing to GitHub repository...${NC}"
  git add .
  git commit -m "Initial commit from Criteria template"
  git branch -M main
  git remote add origin "https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git"
  git push -u origin main
  
  echo -e "${GREEN}Successfully pushed to GitHub repository!${NC}"
  echo -e "Repository URL: ${BLUE}https://github.com/$GITHUB_USERNAME/$PROJECT_NAME${NC}"
fi

echo -e "${GREEN}✅ Project setup complete!${NC}"
echo ""
echo "To get started, run:"
echo -e "${BLUE}  cd $PROJECT_NAME${NC}"
echo -e "${BLUE}  npm install${NC} (or ${BLUE}pnpm install${NC})"
echo -e "${BLUE}  npm run dev${NC} (or ${BLUE}pnpm dev${NC})"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}" 