#!/usr/bin/env bash
# shellcheck source-path=SCRIPTDIR
SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../libs/helpers.sh
source "${SCRIPT_DIR}/../libs/helpers.sh"

function test_color_function() {
    local func_name="$1"
    local expected_start_code="$2"
    local expected_end_code="$3"
    local test_string="TEST"
    local result
    result=$("$func_name" "$test_string") 
    if [[ "$result" == "${expected_start_code}${test_string}${expected_end_code}" ]]; then
        echo "✅ Test passed for $func_name"
    else
        echo "❌ Test failed for $func_name"
        echo "  Expected: ${expected_start_code}${test_string}${expected_end_code}"
        echo "  Got:      $result"
        return 1
    fi
    return 0
}

function test_echoc_function() {
    local color_name="$1"
    local expected_color_code="$2"
    local title="TITLE"
    local message="This is a message."
    local expected_output=""

    # Simulate may_color returning true for echoc to apply color
    may_color() { return 0; }

    # Capture stdout
    local output
    output=$(echoc "$color_name" "$title" "$message")

    expected_output="${expected_color_code}${title}${NC} ${message}"

    if [[ "$output" == "$expected_output" ]]; then
        echo "✅ Test passed for echoc with color $color_name"
    else
        echo "❌ Test failed for echoc with color $color_name"
        echo "  Expected: '$expected_output'"
        echo "  Got:      '$output'"
        return 1
    fi

    # Reset may_color for other tests
    unset -f may_color
    # shellcheck source=../libs/helpers.sh
    source "${SCRIPT_DIR}/../libs/helpers.sh" # Reload to get original may_color
}


  # --- Color Function Tests ---
  test_color_function "red" $'\033[31m' $'\033[0m'
  test_color_function "green" $'\033[32m' $'\033[0m'
  test_color_function "yellow" $'\033[33m' $'\033[0m'
  test_color_function "blue" $'\033[34m' $'\033[0m'
  test_color_function "magenta" $'\033[35m' $'\033[0m'
  test_color_function "cyan" $'\033[36m' $'\033[0m'
  test_color_function "white" $'\033[37m' $'\033[0m'
  test_color_function "bright_black" $'\033[90m' $'\033[0m'
  test_color_function "bright_red" $'\033[91m' $'\033[0m'
  test_color_function "bright_green" $'\033[92m' $'\033[0m'
  test_color_function "bright_yellow" $'\033[93m' $'\033[0m'
  test_color_function "bright_blue" $'\033[94m' $'\033[0m'
  test_color_function "bright_magenta" $'\033[95m' $'\033[0m'
  test_color_function "bright_cyan" $'\033[96m' $'\033[0m'
  test_color_function "bright_white" $'\033[97m' $'\033[0m'

  # --- Background Color Function Tests ---
  test_color_function "bg_black" $'\033[40m' $'\033[0m'
  test_color_function "bg_red" $'\033[41m' $'\033[0m'
  test_color_function "bg_green" $'\033[42m' $'\033[0m'
  test_color_function "bg_yellow" $'\033[43m' $'\033[0m'
  test_color_function "bg_blue" $'\033[44m' $'\033[0m'
  test_color_function "bg_magenta" $'\033[45m' $'\033[0m'
  test_color_function "bg_cyan" $'\033[46m' $'\033[0m'
  test_color_function "bg_white" $'\033[47m' $'\033[0m'
  test_color_function "bg_bright_black" $'\033[100m' $'\033[0m'
  test_color_function "bg_bright_red" $'\033[101m' $'\033[0m'
  test_color_function "bg_bright_green" $'\033[102m' $'\033[0m'
  test_color_function "bg_bright_yellow" $'\033[103m' $'\033[0m'
  test_color_function "bg_bright_blue" $'\033[104m' $'\033[0m'
  test_color_function "bg_bright_magenta" $'\033[105m' $'\033[0m'
  test_color_function "bg_bright_cyan" $'\033[106m' $'\033[0m'
  test_color_function "bg_bright_white" $'\033[107m' $'\033[0m'

  # --- echoc Function Tests ---
  test_echoc_function "red" $'\033[31m'
  test_echoc_function "green" $'\033[32m'
  test_echoc_function "yellow" $'\033[33m'
  test_echoc_function "blue" $'\033[34m'
  test_echoc_function "magenta" $'\033[35m'
  test_echoc_function "cyan" $'\033[36m'
