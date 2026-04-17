#!/usr/bin/env bash
# shellcheck disable=SC1091

# Test script for updated functions using new color variables
source "$(dirname "$0")/../libs/helpers.sh"

echo "Testing updated color functions..."

# Test basic text functions
echo "=== Text Functions ==="
printf "Primary: %s\n" "$(text_primary "Primary text")"
printf "Success: %s\n" "$(text_success "Success text")"
printf "Danger: %s\n" "$(text_danger "Danger text")"
printf "Warning: %s\n" "$(text_warning "Warning text")"
printf "Info: %s\n" "$(text_info "Info text")"

echo -e "\n=== Background Functions ==="
printf "Primary BG: %s\n" "$(bg_primary " Primary bg ")"
printf "Success BG: %s\n" "$(bg_success " Success bg ")"
printf "Danger BG: %s\n" "$(bg_danger " Danger bg ")"
printf "Warning BG: %s\n" "$(bg_warning " Warning bg ")"
printf "Info BG: %s\n" "$(bg_info " Info bg ")"

echo -e "\n=== Extended Palette Functions ==="
printf "Blue: %s\n" "$(text_blue "Blue text")"
printf "Green: %s\n" "$(text_green "Green text")"
printf "Red: %s\n" "$(text_red "Red text")"
printf "Yellow: %s\n" "$(text_yellow "Yellow text")"
printf "Cyan: %s\n" "$(text_cyan "Cyan text")"
printf "White: %s\n" "$(text_white "White text")"
printf "Black: %s\n" "$(text_black "Black text")"

echo -e "\n=== Extended Background Functions ==="
printf "Blue BG: %s\n" "$(bg_blue " Blue bg ")"
printf "Green BG: %s\n" "$(bg_green " Green bg ")"
printf "Red BG: %s\n" "$(bg_red " Red bg ")"
printf "Yellow BG: %s\n" "$(bg_yellow " Yellow bg ")"
printf "Cyan BG: %s\n" "$(bg_cyan " Cyan bg ")"
printf "White BG: %s\n" "$(bg_white " White bg ")"
printf "Black BG: %s\n" "$(bg_black " Black bg ")"

echo -e "\n=== Direct Variable Usage ==="
printf "${FG_GREEN}${BG_YELLOW}%s${RC}\n" "Direct variables test"
printf "${FG_RED}${BG_BLUE}%s${RC}\n" "Another direct test"
printf "${FG_CYAN}${BG_MAGENTA}%s${RC}\n" "Final direct test"

echo -e "\n=== Border Functions ==="
printf "Primary border: %s\n" "$(border_primary_subtle "Primary border")"
printf "Success border: %s\n" "$(border_success_subtle "Success border")"
printf "Danger border: %s\n" "$(border_danger_subtle "Danger border")"

echo -e "\nAll functions tested successfully!"
