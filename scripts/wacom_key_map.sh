#!/usr/bin/bash

PAD='Wacom Intuos BT S Pad pad'
STYLUS='Wacom Intuos BT S Pen stylus'
MAIN_WINDOW=true

# Buttons [ 1 2 (POWER) 3 8 ]
# Undo
xsetwacom set "${PAD}" Button 1 "key +ctrl z"
# Paste
# xsetwacom set "${PAD}" Button 2 "key +ctrl v"
# Eraser
xsetwacom set "${PAD}" Button 3 "key shift"
# Redo
xsetwacom set "${PAD}" Button 8 "key +ctrl y"

#  |
#  |
#  |
#  |
#  O  Button 3
#  o  Button 2
#  |
#  v  Button 1 (unremapable)

# Right Button
xsetwacom set "${STYLUS}" Button 2 "button +3"
# Undo
xsetwacom set "${STYLUS}" Button 3 "key +ctrl z"

if xrandr | grep -q -E "DisplayPort-0 connected"
then
    xsetwacom set "${STYLUS}" MapToOutput DisplayPort-0
    xsetwacom set "${STYLUS}" MapToOutput DisplayPort-0
elif xrandr | grep -q -E "DisplayPort-3 connected"
then
    xsetwacom set "${STYLUS}" MapToOutput DisplayPort-3
    xsetwacom set "${STYLUS}" MapToOutput DisplayPort-3
fi
# if $MAIN_WINDOW
# then
#     xsetwacom set "${STYLUS}" MapToOutput eDP
#     xsetwacom set "${STYLUS}" MapToOutput eDP
# fi;

exit
