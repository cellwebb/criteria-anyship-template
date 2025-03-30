#!/bin/bash

# Script to create a new Criteria app from the template

# Default project name
DEFAULT_PROJECT_NAME="criteria-app"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Display banner
echo -e "${BLUE}"
echo "   ___ _ _ _            _      "
echo "  / __| (_) |_ ___ _ __(_) __ _"
echo " | |   | | __/ _ \ '__| |/ _\` |"
echo " | |___| | ||  __/ |  | | (_| |"
echo "  \____|_|\__\___|_|  |_|\__,_|"
echo -e "${NC}"
echo "Create a new Criteria app from the template"
echo ""

# Get project name
if [ -z "$1" ]; then
  echo -n "Project name (default: $DEFAULT_PROJECT_NAME): "
  read PROJECT_NAME
  PROJECT_NAME=${PROJECT_NAME:-$DEFAULT_PROJECT_NAME}
else
  PROJECT_NAME=$1
fi

# Clone the repository
echo "Cloning the Criteria template..."
git clone --depth=1 https://github.com/shipanyai/shipany-template-one.git $PROJECT_NAME
cd $PROJECT_NAME

# Remove git history
rm -rf .git

# Initialize a new git repository
git init

# Run setup script
echo -e "${GREEN}Setting up your new Criteria app...${NC}"
npm run setup $PROJECT_NAME

echo -e "${GREEN}✅ Project setup complete!${NC}"
echo ""
echo "To get started, run:"
echo -e "${BLUE}  cd $PROJECT_NAME${NC}"
echo -e "${BLUE}  npm install${NC} (or ${BLUE}pnpm install${NC})"
echo -e "${BLUE}  npm run dev${NC} (or ${BLUE}pnpm dev${NC})"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}" 