#!/usr/bin/env bash
set -euo pipefail

if [ ! -f .env ]; then
  echo "Error: .env file not found" >&2
  exit 1
fi

source .env

if [ -z "${AIRTABLE_TOKEN:-}" ]; then
  echo "Error: AIRTABLE_TOKEN not set in .env" >&2
  exit 1
fi

mkdir -p dist
sed "s/YOUR_AIRTABLE_TOKEN_HERE/$AIRTABLE_TOKEN/" team_priorities.html > dist/team_priorities.html

echo "Built dist/team_priorities.html — ready to upload to SharePoint"
