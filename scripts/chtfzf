#!/usr/bin/env bash

if [ ! -e ~/.cache/chtshlist ]; then  
  curl -s cht.sh/:list > ~/.cache/chtshlist
fi

utils=$(cat ~/.cache/chtshlist)

selected=$(echo "$utils" | fzf-tmux -p40%)

if [ -z "$selected" ]; then  
  exit 0
fi

sheet=$(curl -s "cht.sh/$selected")
echo "$sheet" | less -r
