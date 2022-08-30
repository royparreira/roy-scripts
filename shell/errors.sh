#!/usr/bin/env bash

# Prints an error message and exit with code 2
#
# Param[1]: error message

trap "exit 2" TERM

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TOP_PID=$$

function raise_error {
  echo -e "\033[0;31m\n${1}\n\033[0m" 1>&2
  kill -s TERM $TOP_PID
}