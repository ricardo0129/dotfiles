#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

#sketchybar --set "$NAME" background.drawing="$SELECTED"


source "$HOME/.config/sketchybar/variables.sh"


SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

if [ "$SELECTED" = "true" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		icon.color="$YELLOW" \
		icon="${SPACE_ICONS[$SID - 1]}" 
		#click_script="$SPACE_CLICK_SCRIPT"
else
	sketchybar --animate tanh 5 --set "$NAME" \
		icon.color="$ICON_COLOR" \
		icon="${SPACE_ICONS[$SID - 1]}" 
		#click_script="$SPACE_CLICK_SCRIPT"
fi
