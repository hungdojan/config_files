#!/usr/bin/bash

PAD='Wacom Intuos BT S Pad pad'
STYLUS='Wacom Intuos BT S Pen stylus'

# Buttons [ 1 2 (POWER) 3 8 ]
# Undo
xsetwacom set "${PAD}" Button 1 "key +ctrl z"
# Paste
xsetwacom set "${PAD}" Button 2 "key +ctrl v"
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

exit
