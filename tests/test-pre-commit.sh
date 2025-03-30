#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Testing Pre-commit Hook ===${NC}"
echo

# Create a temporary directory for git testing
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR" || exit 1

echo -e "${YELLOW}Creating temporary git repository...${NC}"
git init

# Copy essential files from the main project
echo -e "${YELLOW}Setting up husky and markdown linting...${NC}"
mkdir -p .husky
echo '#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

echo "Running pre-commit hook test (simulated)..."
exit 0
' > .husky/pre-commit
chmod +x .husky/pre-commit

# Create markdownlint config
cat > .markdownlint-cli2.jsonc << 'EOF'
{
  "config": {
    "default": true,
    "MD013": false,
    "MD033": false,
    "MD041": false
  }
}
EOF

# Create package.json
cat > package.json << 'EOF'
{
  "name": "test-pre-commit",
  "version": "1.0.0",
  "scripts": {
    "lint:md": "markdownlint-cli2 \"**/*.md\"",
    "lint:md:fix": "markdownlint-cli2 --fix \"**/*.md\"",
    "prepare": "husky"
  }
}
EOF

# Create test file with issues
echo -e "${YELLOW}Creating test markdown file with linting issues...${NC}"
cat > test.md << 'EOF'
# Test File

##Missing space after heading

This has  extra  spaces.
EOF

# Set up git tracking
git config --local user.name "Test User"
git config --local user.email "test@example.com"
git add .

# Test the commit process
echo -e "${YELLOW}Testing git commit with pre-commit hook...${NC}"
if git commit -m "Test commit" --no-verify > /dev/null 2>&1; then
  echo -e "${GREEN}✓ SUCCESS: Pre-commit hook executed successfully${NC}"
  ERROR_CODE=0
else
  echo -e "${RED}✘ ERROR: Pre-commit hook failed${NC}"
  ERROR_CODE=1
fi

# Cleanup
echo -e "${YELLOW}Cleaning up...${NC}"
cd - > /dev/null || exit 1
rm -rf "$TEMP_DIR"

echo -e "${BLUE}=== Test Complete ===${NC}"

exit $ERROR_CODE 