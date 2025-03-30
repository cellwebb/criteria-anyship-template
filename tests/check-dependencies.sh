#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Checking Dependencies ===${NC}"
echo

echo -e "${YELLOW}Checking for outdated dependencies...${NC}"
pnpm outdated

echo
echo -e "${GREEN}Tip: Run 'pnpm update' to update dependencies according to your package.json${NC}"
echo -e "${GREEN}or 'pnpm update --latest' to update all dependencies to their latest versions.${NC}"
echo
echo -e "${BLUE}=== Check Complete ===${NC}" 