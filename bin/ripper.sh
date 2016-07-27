#!/bin/bash

# Get the relative paths

CURRENT_DIR="$(dirname "$0")"
ROOT_DIR=$( cd "$(dirname "$my_dir")" ; pwd -P )

: "${RIPPER_ROOT:?Need to set and non-empty. Please set this variable in your profile, bashrc or zshrc file}"
: "${RIPPER_MEDIA_ROOT:?Need to set and non-empty. Please set this variable in your profile, bashrc or zshrc file}"

source $ROOT_DIR/utils
source $ROOT_DIR/media

$@
