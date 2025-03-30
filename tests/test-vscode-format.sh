#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Testing VS Code Format on Save Simulation ===${NC}"
echo

# Create a temporary markdownlint configuration
TEMP_CONFIG="tests/temp.markdownlint-cli2.jsonc"
echo -e "${YELLOW}Creating temporary markdownlint configuration...${NC}"
cat > "$TEMP_CONFIG" << 'EOF'
{
  "config": {
    "default": true,
    "MD013": false,
    "MD033": false,
    "MD041": false
  }
}
EOF

# Create a test file with issues
echo -e "${YELLOW}Creating test markdown file with formatting issues...${NC}"
TEST_FILE="tests/markdown/vscode-test.md"

cat > "$TEST_FILE" << 'EOF'
# VS Code Format Test

This line has trailing spaces.   

This line has  multiple  spaces.

* This is a bullet point
*This is missing a space after the asterisk

```
// Code block without language
function test() {
  console.log("Hello");
}
```

1. First item
2. Second item
EOF

echo -e "${YELLOW}Test file created. Now simulating VS Code format on save...${NC}"
echo -e "Running: pnpm exec markdownlint-cli2 --fix --no-include-default-config --config $TEMP_CONFIG $TEST_FILE"

# Save the original for comparison
cp "$TEST_FILE" "${TEST_FILE}.orig"

# Run the formatter
pnpm exec markdownlint-cli2 --fix --no-include-default-config --config "$TEMP_CONFIG" "$TEST_FILE" || true

# Compare files before and after fixing
echo -e "${YELLOW}Checking differences after simulated format-on-save:${NC}"
if diff -q "$TEST_FILE" "${TEST_FILE}.orig" > /dev/null; then
  echo -e "${RED}✘ No changes made to test file${NC}"
else
  echo -e "${GREEN}✓ Successfully formatted test file${NC}"
  echo -e "${BLUE}Changes made:${NC}"
  diff -u "${TEST_FILE}.orig" "$TEST_FILE" | grep -v "^---" | grep -v "^+++" | grep "^[+-]"
fi

# Cleanup
rm -f "${TEST_FILE}.orig"
rm -f "$TEMP_CONFIG"

echo -e "${BLUE}=== Test Complete ===${NC}" 