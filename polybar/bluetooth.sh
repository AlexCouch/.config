#!/bin/bash
device_name=$(bluetoothctl -- info F8:DF:15:98:E5:A9 | grep "Name:" | cut -d":" -f2 | sed -e 's/^\s*//')
if [[ -n $device_name ]]; then
	echo "%{F#00a6ff}%{F-} $device_name"
fi
	
