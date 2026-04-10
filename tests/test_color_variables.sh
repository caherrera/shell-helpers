#!/usr/bin/env bash

# Test script for the new color variables
source "$(dirname "$0")/../libs/helpers.sh"

echo "Testing color variables..."

# Test basic usage
printf "${FG_GREEN}${BG_YELLOW}%s${RC}\n" "hola"
printf "${FG_RED}${BG_BLUE}%s${RC}\n" "mundo"
printf "${FG_CYAN}${BG_MAGENTA}%s${RC}\n" "test"

# Test with different combinations
printf "${FG_WHITE}${BG_BLACK}%s${RC}\n" "Blanco sobre negro"
printf "${FG_BLACK}${BG_WHITE}%s${RC}\n" "Negro sobre blanco"
printf "${FG_YELLOW}${BG_RED}%s${RC}\n" "Amarillo sobre rojo"

echo "All color variables working!"
