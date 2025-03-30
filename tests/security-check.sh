#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Checking Security Vulnerabilities ===${NC}"
echo

echo -e "${YELLOW}Running dependency security audit...${NC}"
pnpm audit

echo
echo -e "${GREEN}Security check completed.${NC}"
echo -e "${GREEN}Run 'pnpm audit fix' to automatically fix vulnerabilities where possible.${NC}"
echo
echo -e "${BLUE}=== Check Complete ===${NC}" 