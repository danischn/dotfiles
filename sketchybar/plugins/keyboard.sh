#!/usr/bin/env bash

keyboard=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')

if [ "$keyboard" == "U.S." ]; then
  keyboard="US"
else
  keyboard="NO"
fi

sketchybar --set $NAME label="$keyboard"
