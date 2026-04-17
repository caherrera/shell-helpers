#!/usr/bin/env bash
# shellcheck disable=SC1091

# Incluimos nuestra librería UI
source "$(dirname "$0")/../libs/helpers.sh"


echo "=== Testing parse_arg function ==="
echo

parse_arg "--project" "KEY" "\$JIRA_PROJECT" "Uses \$JIRA_PROJECT if set, otherwise \$JIRA_DEFAULT_PROJECT."

echo
echo "=== Testing toUsage function ==="
echo

{
  parse_arg "-h|--help"    ""          "Show this help message"
  parse_arg "-v|--verbose" "false"     "Enable verbose output"
  parse_arg "-f|--file"    "input.txt" "Path to input file"
  parse_arg "--project"    "KEY"       "\$JIRA_PROJECT"    "Uses \$JIRA_PROJECT if set, otherwise \$JIRA_DEFAULT_PROJECT."

} | toUsage 2
