#!/usr/bin/env bash

scripts_directory="/opt/shell-color-scripts/colorscripts"

scripts_files=("$scripts_directory"/*)

random_script="${scripts_files[$RANDOM % ${#scripts_files[@]}]}"

sh -c "$random_script"
