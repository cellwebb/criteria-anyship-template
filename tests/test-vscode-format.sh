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

# Create a temporary test file with known markdown issues
TEMP_TEST_FILE="tests/vscode-test.md"
echo -e "${YELLOW}Creating test markdown file with formatting issues...${NC}"
cat > "$TEMP_TEST_FILE" << 'EOF'
# VSCode Format Test

##Missing space after heading

This is a paragraph with  double  spaces.

* Bullet list
* With inconsistent
- markers

[Broken link](

![Missing alt text]()

```javascript
// Code with no spacing
function test(){
console.log("hello");
}
```
EOF

echo -e "${YELLOW}Test file created. Now simulating VS Code format on save...${NC}"

# Make a copy for comparison
cp "$TEMP_TEST_FILE" "${TEMP_TEST_FILE}.original"

# Simulate VS Code format on save using markdownlint-cli2 --fix
echo -e "Running: pnpm exec markdownlint-cli2 --fix --no-include-default-config --config $TEMP_CONFIG $TEMP_TEST_FILE"
pnpm exec markdownlint-cli2 --fix --no-include-default-config --config "$TEMP_CONFIG" "$TEMP_TEST_FILE" || true

# Compare before and after
echo -e "${YELLOW}Checking differences after simulated format-on-save:${NC}"
if diff -q "$TEMP_TEST_FILE" "${TEMP_TEST_FILE}.original" > /dev/null; then
  echo -e "${RED}✘ No changes made to test file${NC}"
  ERROR_CODE=1
else
  echo -e "${GREEN}✓ Successfully fixed formatting issues${NC}"
  echo -e "${BLUE}Changes made:${NC}"
  diff -u "${TEMP_TEST_FILE}.original" "$TEMP_TEST_FILE" | grep -v "^---" | grep -v "^+++" | grep "^[+-]" | head -10
  ERROR_CODE=0
fi

# Cleanup
rm -f "$TEMP_CONFIG" "$TEMP_TEST_FILE" "${TEMP_TEST_FILE}.original"

echo -e "${BLUE}=== Test Complete ===${NC}"

exit $ERROR_CODE 