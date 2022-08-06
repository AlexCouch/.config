#!/bin/sh

DESKTOP=$(bspc query -D -m $1 -d .active)
WINDOW=$(bspc query -N -n .window.active -d $DESKTOP -m $1)
TITLE_RAW=$(xprop -id "$WINDOW" WM_NAME 2> /dev/null)
TITLE=$(echo $TITLE_RAW | cut -d'"' -f2)
if [ $? -eq 0 ]; then
	if [ -z "$TITLE" ]; then
		echo ""
	else
		echo $TITLE
	fi
else
	echo ""
fi
