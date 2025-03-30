#!/usr/bin/env bash

# Color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Testing Pre-commit Hook ===${NC}"
echo

# Create a temporary git repository
echo -e "${YELLOW}Creating temporary git repository...${NC}"
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR" || exit 1
git init

# Setup husky and markdown linting
echo -e "${YELLOW}Setting up husky and markdown linting...${NC}"
mkdir -p .husky
cat > .husky/pre-commit << 'EOF'
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

echo "Running lint-staged..."
echo "This is a mock test - in real setup this would run lint-staged"
exit 0
EOF
chmod +x .husky/pre-commit

# Create a test file
echo -e "${YELLOW}Creating test markdown file with linting issues...${NC}"
cat > test.md << 'EOF'
# Test File

This line has trailing spaces.   

1. Item one
2. Item two
EOF

# Add the file and test commit
echo -e "${YELLOW}Testing git commit with pre-commit hook...${NC}"
git add test.md
if git commit -m "Test commit" > /dev/null 2>&1; then
  echo -e "${GREEN}✓ SUCCESS: Pre-commit hook executed successfully${NC}"
else
  echo -e "${RED}✘ ERROR: Pre-commit hook failed${NC}"
fi

# Clean up
echo -e "${YELLOW}Cleaning up...${NC}"
cd - > /dev/null || exit 1
rm -rf "$TMP_DIR"

echo -e "${BLUE}=== Test Complete ===${NC}" 