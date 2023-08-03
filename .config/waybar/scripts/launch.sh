#!/bin/bash
cd $(dirname $0)
sass ../style.scss ../style.css --no-source-map
waybar
