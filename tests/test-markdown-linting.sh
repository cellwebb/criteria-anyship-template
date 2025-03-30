#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Testing Markdown Linting ===${NC}"
echo

# Test detection of issues
echo -e "${YELLOW}Testing issue detection...${NC}"
echo -e "Running: pnpm lint:md tests/markdown/*.md"
if pnpm lint:md tests/markdown/*.md > /dev/null 2>&1; then
  echo -e "${RED}✘ ERROR: Linter didn't detect any issues in test files that contain deliberate errors${NC}"
  echo
else
  echo -e "${GREEN}✓ SUCCESS: Linter correctly detected issues in test files${NC}"
  echo
fi

# Save original files for comparison
echo -e "${YELLOW}Creating backup of test files for comparison...${NC}"
mkdir -p tests/markdown/backup
cp tests/markdown/*.md tests/markdown/backup/

# Test auto-fixing
echo -e "${YELLOW}Testing auto-fixing...${NC}"
echo -e "Running: pnpm lint:md:fix tests/markdown/*.md"
pnpm lint:md:fix tests/markdown/*.md || true

# Compare files before and after fixing
echo -e "${YELLOW}Checking differences after auto-fixing:${NC}"
for file in tests/markdown/*.md; do
  basename=$(basename "$file")
  if diff -q "$file" "tests/markdown/backup/$basename" > /dev/null; then
    echo -e "${RED}✘ No changes made to $basename${NC}"
  else
    echo -e "${GREEN}✓ Successfully fixed issues in $basename${NC}"
    echo -e "${BLUE}Changes made:${NC}"
    diff -u "tests/markdown/backup/$basename" "$file" | grep -v "^---" | grep -v "^+++" | grep "^[+-]" | head -10
    echo
  fi
done

# Cleanup
rm -rf tests/markdown/backup

echo -e "${BLUE}=== Test Complete ===${NC}" 