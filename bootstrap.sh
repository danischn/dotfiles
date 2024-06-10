#!/bin/bash

# git clone $url && cd .dotfiles && source bootstrap.sh
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Vim
ln -sf "${BASEDIR}"/vimrc ~/.vimrc

# Shell
ln -sf "${BASEDIR}"/shell/bashrc ~/.bashrc
ln -sf "${BASEDIR}"/shell/bash_profile ~/.bash_profile
ln -sf "${BASEDIR}"/shell/inputrc ~/.inputrc

symlinks=(
  "alacritty"
  "git"
  "karabiner"
  "nvim" 
  "sketchybar"
  "skhd" 
  "tmux" 
  "yabai"
)
for dir in "${symlinks[@]}"; do
  ln -sf "${BASEDIR}"/shell/"$dir" ~/.config/"$dir"
done
