#!/bin/bash
BG=/tmp/scr.png
scrot -o /tmp/scr.png
convert $BG -scale 10% -scale 1000% $BG
i3lock -eui $BG
