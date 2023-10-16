#!/usr/bin/env bash

utils="fzf ls mv"
utils=`echo "$utils" | tr ' ' '\n'`
selected=`echo "$utils" | fzf-tmux -p30%`

sheet=`curl -s "cht.sh/$selected"`
echo "$sheet" | less -r
