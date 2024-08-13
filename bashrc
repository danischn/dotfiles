#!/bin/bash

# ---------------- miscellaneous  ---------------

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH=~/dotfiles/scripts/:$PATH
export EDITOR="nvim"
export PAGER="less"
export MANPAGER='nvim +Man!'
source "$HOME/dotfiles/dircolors"

# ---------------  clean ~  --------------
 
export CARGO_HOME="$XDG_DATA_HOME"/cargo 
export LESSHISTFILE=-

# ------------------- history -------------------

HISTSIZE=1048576
HISTFILESIZE=$HISTSIZE

#Check if history file exists
HISTFILE=$XDG_STATE_HOME/bash/history
if [ ! -f "$HISTFILE" ]; then
  mkdir -p "$(dirname "$HISTFILE")"
  touch "$HISTFILE"
fi

HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# ------------------- fzf -----------------------

export FZF_DEFAULT_OPTS="
  --color hl:#5f87af,hl+:#5f87af,fg+:#d0d0d0,bg+:-1,border:#ffffff
  --layout=reverse
  --prompt='❯ '
  --pointer='▶'
  --marker='│'
  --border=sharp
  --tmux
"
eval "$(fzf --bash)"

# ------------------ functions ------------------

function ff(){
  fd_options=(--follow --color=always)
  exclude_dirs=(
    Library
    Music
    Movies
    Public
    Desktop
    Applications
    Pictures
    automatic_backups
  )

  for dir in "${exclude_dirs[@]}"; do
    fd_options+=(--exclude "$dir")
  done

  selected=$(fd "${fd_options[@]}" | fzf-tmux -p50%,30% --ansi)
  if [ -z "$selected" ]; then return; fi

  filetype=$(file --mime-type -b "$selected")

  if [[ $filetype == "inode/directory" ]]; then
      cd "$selected" || return
  elif [[ $filetype == text/* || $filetype == application/json || $filetype == inode/x-empty ]]; then
      cd "$(dirname "$selected")" || return
      $EDITOR "$(basename "$selected")"
  else
      cd "$(dirname "$selected")" || return
      xdg-open "$(basename "$selected")"
  fi
}
bind '"\C-f":"\C-uff\n"'

function mcdir() {
  mkdir "$1"
  cd "$1" || return
}


# ------------------ aliases ------------------

alias ls='ls -hF --color=auto'
alias l='ls -lahF --color=auto'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -ir'
alias b='cd - >/dev/null'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias tam='tmux attach -t main'
alias tnm='tmux new -s main'
alias tks='tmux kill-server'
alias n='nvim'
alias ntrash='cd ~/.local/share/nvim/mini.files/trash'
alias path='echo -e ${PATH//:/\\n}'
alias week='date +%V'
alias cpath='pwd | pbcopy'


# ------------------- prompt -------------------

PROMPT_DIRTRIM=3

# Colors
cyan='\[\e[1;36m\]'
purple='\[\e[35m\]'
reset='\[\e[0;0m\]'

# get current branch in git repo
function git_branch(){
  git branch 2>/dev/null | grep '^*' | sed 's/*//'
}

function git_dirty(){
  [[ -z $(git status -s 2>/dev/null) ]] || echo '?'
}

PS1="${cyan}\w${purple}\$(git_branch)\$(git_dirty) ${reset}➜ "
