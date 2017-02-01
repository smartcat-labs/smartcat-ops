#!/usr/bin/env bash

# Functions and definitions for formatted colorized output to stdout.

# Color definitions.
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_BLUE='\033[1;34m'
LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Prints formatted and colorized info message.
#
# Parameters:
#   $1 - caller name.
#   $2 - message.
function prettyPrintInfo() {
  TIME=$(date +%R:%S)
  echo -e "[${WHITE}$TIME${NC}]: ${CYAN}"$1"${NC}: ${GREEN}INFO${NC}: $2"
}

# Prints formatted and colorized error message.
#
# Parameters:
#   $1 - caller name.
#   $2 - message.
function prettyPrintError() {
  TIME=$(date +%R:%S)
  # '1>&2' will redirect output to stderr
  echo -e "[${WHITE}$TIME${NC}]: ${CYAN}"$1"${NC}: ${RED}ERROR${NC}: $2" 1>&2
}

# Prints formatted and colorized warning message.
#
# Parameters:
#   $1 - caller name.
#   $2 - message.
function prettyPrintWarning() {
  TIME=$(date +%R:%S)
  echo -e "[${WHITE}$TIME${NC}]: ${CYAN}"$1"${NC}: ${YELLOW}WARNING${NC}: $2"
}

# Prints formatted and colorized info message.
# Requires "$SCRIPT_DISPLAY_NAME" variable to be defined.
#
# Parameters:
#   $1 - message.
function printInfo() {
  prettyPrintInfo "$SCRIPT_DISPLAY_NAME" "$1"
}

# Prints formatted and colorized error message.
# Requires "$SCRIPT_DISPLAY_NAME" variable to be defined.
#
# Parameters:
#   $1 - message.
function printError() {
  prettyPrintError "$SCRIPT_DISPLAY_NAME" "$1"
}

# Prints formatted and colorized warning message.
# Requires "$SCRIPT_DISPLAY_NAME" variable to be defined.
#
# Parameters:
#   $1 - message.
function printWarning() {
  prettyPrintWarning "$SCRIPT_DISPLAY_NAME" "$1"
}
