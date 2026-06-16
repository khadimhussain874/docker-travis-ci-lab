#!/bin/bash

# Travis CI Build Monitor Script

REPO_SLUG="YOUR-USERNAME/docker-travis-ci-lab"
TRAVIS_API="https://api.travis-ci.com"

echo "Monitoring Travis CI builds for $REPO_SLUG"
echo "=========================================="

# Get latest build status
curl -s -H "Travis-API-Version: 3" \
     "$TRAVIS_API/repo/$REPO_SLUG/builds?limit=5" | \
     jq -r '.builds[] | "Build #\(.number): \(.state) (\(.branch)) - \(.started_at)"'

echo ""
echo "For detailed logs, visit:"
echo "https://travis-ci.com/$REPO_SLUG"
