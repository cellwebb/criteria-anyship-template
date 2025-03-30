#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}====================================${NC}"
echo -e "${BLUE}= Markdown Linting Test Suite      =${NC}"
echo -e "${BLUE}====================================${NC}"
echo

# Run all the test scripts
echo -e "${YELLOW}Running markdown linting tests...${NC}"
./tests/test-markdown-linting.sh
echo

echo -e "${YELLOW}Running pre-commit hook tests...${NC}"
./tests/test-pre-commit.sh
echo

echo -e "${YELLOW}Running VS Code format on save tests...${NC}"
./tests/test-vscode-format.sh
echo

echo -e "${GREEN}All tests completed!${NC}" 