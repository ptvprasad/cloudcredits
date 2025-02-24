#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Running Post-Build Tests..."

# Set the deployed server URL (Updated with your actual EC2 public IP)
SERVER_URL="http://13.127.29.232"

# Test 1: Check if the web server is running (HTTP 200 OK response)
if curl -s --head --request GET $SERVER_URL | grep "200 OK" > /dev/null; then
    echo -e "${GREEN}[PASS] Test 1: Web server is running and accessible.${NC}"
else
    echo -e "${RED}[FAIL] Test 1: Web server is not reachable!${NC}"
    exit 1
fi

# Test 2: Check if the page contains expected text
EXPECTED_TEXT="Welcome to My Web App"
if curl -s $SERVER_URL | grep "$EXPECTED_TEXT" > /dev/null; then
    echo -e "${GREEN}[PASS] Test 2: Page contains expected content.${NC}"
else
    echo -e "${RED}[FAIL] Test 2: Page content is incorrect!${NC}"
    exit 1
fi

echo -e "${GREEN}All Post-Build Tests Passed!${NC}"
