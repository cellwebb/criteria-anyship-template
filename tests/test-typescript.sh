#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Testing TypeScript Types ===${NC}"
echo

# Test TypeScript compilation
echo -e "${YELLOW}Testing TypeScript compilation...${NC}"
echo -e "Running: pnpm tsc --noEmit"

if pnpm tsc --noEmit; then
  echo -e "${GREEN}✓ SUCCESS: TypeScript compilation completed successfully${NC}"
else
  echo -e "${RED}✘ ERROR: TypeScript compilation failed${NC}"
  exit 1
fi

echo
echo -e "${BLUE}=== Test Complete ===${NC}" 