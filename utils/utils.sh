#!/bin/sh


DEBUG_PREFIX="\033[1;34m[DEBUG]\033[0m"
ERROR_PREFIX="\033[1;31m[ERROR]\033[0m"

function echo_debug() {
    echo "${DEBUG_PREFIX} $1"
}

function echo_error() {
    echo "${ERROR_PREFIX} $1"
}
