#!/bin/bash
set -eo pipefail
item=$(cliphist list | rofi -dmenu)
echo "$item" | cliphist decode | wl-copy
