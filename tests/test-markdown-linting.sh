#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Testing Markdown Linting ===${NC}"
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

# Create a temporary test file with known markdown issues
TEMP_TEST_FILE="tests/temp-test-file.md"
echo -e "${YELLOW}Creating temporary test file with issues...${NC}"
cat > "$TEMP_TEST_FILE" << 'EOF'
# Test Heading with Issues

##Missing space

This is a paragraph with  extra  spacing.

* Bullet
* list with inconsistent markers
- inconsistent marker

```js
// Code block without proper spacing
var test = function() {
  console.log("Hello world");
}
```

[Link text with no destination]()

![Image with no source or alt]()
EOF

# Test detection of issues
echo -e "${YELLOW}Testing issue detection...${NC}"
echo -e "Running: pnpm exec markdownlint-cli2 --no-include-default-config --config $TEMP_CONFIG $TEMP_TEST_FILE"
if pnpm exec markdownlint-cli2 --no-include-default-config --config "$TEMP_CONFIG" "$TEMP_TEST_FILE" > /dev/null 2>&1; then
  echo -e "${RED}✘ ERROR: Linter didn't detect any issues in test file that contains deliberate errors${NC}"
  ERROR_COUNT=1
else
  echo -e "${GREEN}✓ SUCCESS: Linter correctly detected issues in test file${NC}"
  ERROR_COUNT=0
fi

# Copy the file for comparison after fixing
cp "$TEMP_TEST_FILE" "${TEMP_TEST_FILE}.original"

# Test auto-fixing
echo -e "${YELLOW}Testing auto-fixing...${NC}"
echo -e "Running: pnpm exec markdownlint-cli2 --fix --no-include-default-config --config $TEMP_CONFIG $TEMP_TEST_FILE"
pnpm exec markdownlint-cli2 --fix --no-include-default-config --config "$TEMP_CONFIG" "$TEMP_TEST_FILE" || true

# Compare file before and after fixing
echo -e "${YELLOW}Checking differences after auto-fixing:${NC}"
if diff -q "$TEMP_TEST_FILE" "${TEMP_TEST_FILE}.original" > /dev/null; then
  echo -e "${RED}✘ No changes made to test file${NC}"
  ERROR_COUNT=$((ERROR_COUNT + 1))
else
  echo -e "${GREEN}✓ Successfully fixed issues in test file${NC}"
  echo -e "${BLUE}Changes made:${NC}"
  diff -u "${TEMP_TEST_FILE}.original" "$TEMP_TEST_FILE" | grep -v "^---" | grep -v "^+++" | grep "^[+-]" | head -10
  echo
fi

# Cleanup
rm -f "$TEMP_CONFIG" "$TEMP_TEST_FILE" "${TEMP_TEST_FILE}.original"

echo -e "${BLUE}=== Test Complete ===${NC}"

# Return error code if any tests failed
exit $ERROR_COUNT 