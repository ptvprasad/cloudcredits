#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Running Post-Build Tests..."

# Set the deployed server URL (Updated with your actual EC2 public IP)
SERVER_URL="http://3.110.194.124"

# Test 1: Check if the web server is running (HTTP 200 OK response)
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L $SERVER_URL)

if [[ "$HTTP_STATUS" -eq 200 ]]; then
    echo -e "${GREEN}[PASS] Test 1: Web server is running and accessible.${NC}"
else
    echo -e "${RED}[FAIL] Test 1: Web server is not reachable! HTTP Status: $HTTP_STATUS${NC}"
    exit 1
fi

# Test 2: Check if the page contains expected text
EXPECTED_TEXT="Welcome to My Web App"
PAGE_CONTENT=$(curl -s $SERVER_URL)

if echo "$PAGE_CONTENT" | grep -q "$EXPECTED_TEXT"; then
    echo -e "${GREEN}[PASS] Test 2: Page contains expected content.${NC}"
else
    echo -e "${RED}[FAIL] Test 2: Page content is incorrect!${NC}"
    echo "Received Content: $PAGE_CONTENT"
    exit 1
fi

echo -e "${GREEN}All Post-Build Tests Passed!${NC}"
