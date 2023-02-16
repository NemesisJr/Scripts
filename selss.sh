#!/bin/bash

 maim -m 10 -s ~/Pictures/Screenshots/$(date +%s).png
 notify-send "Screenshot Saved" "Pictures/Screenshots"

