#!/bin/bash
set -eo pipefail
cd $(dirname $0)
option="$(jq -r keys[] leave.json | rofi -dmenu -p "Leave session")"
eval "$(jq -r ".\"$option\"" leave.json)"
