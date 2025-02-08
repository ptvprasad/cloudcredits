i#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Running Pre-Build Tests..."

# Test 1: Check if the HTML file exists
if [ -f "src/index.html" ]; then
    echo -e "${GREEN}[PASS] Test 1: index.html file exists.${NC}"
else
    echo -e "${RED}[FAIL] Test 1: index.html file is missing!${NC}"
    exit 1
fi

# Test 2: Check if the HTML file is not empty
if [ -s "src/index.html" ]; then
    echo -e "${GREEN}[PASS] Test 2: index.html is not empty.${NC}"
else
    echo -e "${RED}[FAIL] Test 2: index.html is empty!${NC}"
    exit 1
fi

# Test 3: Validate basic HTML structure (checks for `<html>` and `<body>` tags)
if grep -q "<html>" "src/index.html" && grep -q "<body>" "src/index.html"; then
    echo -e "${GREEN}[PASS] Test 3: index.html has valid HTML structure.${NC}"
else
    echo -e "${RED}[FAIL] Test 3: index.html is missing essential tags!${NC}"
    exit 1
fi

echo -e "${GREEN}All Pre-Build Tests Passed!${NC}"

