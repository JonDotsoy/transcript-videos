#!/bin/sh


DEBUG_PREFIX="\033[1;34m[DEBUG]\033[0m"
ERROR_PREFIX="\033[1;31m[ERROR]\033[0m"
INFO_PREFIX="\033[1;32m[INFO]\033[0m"
WARNING_PREFIX="\033[1;33m[WARNING]\033[0m"

function echo_debug() {
    echo "${DEBUG_PREFIX} $@"
}

function echo_error() {
    echo "${ERROR_PREFIX} $@"
}

function echo_info() {
    echo "${INFO_PREFIX} $@"
}

function echo_warning() {
    echo "${WARNING_PREFIX} $@"
}
