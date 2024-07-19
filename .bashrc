#!/bin/bash

# ------------------- Options -------------------

PATH=~/dotfiles/scripts/:$PATH
HISTSIZE=1048576
HISTFILESIZE=$HISTSIZE
HISTFILE=$XDG_STATE_HOME/bash/history
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

export EDITOR="nvim"

# Colors (https://geoff.greer.fm/lscolors/)
export CLICOLOR=
export LSCOLORS='exfxcxdxbxegedabagacad' 

# Unknown locale, assuming C error
export LANG="en_US.UTF-8"

export FZF_DEFAULT_OPTS="
  --layout=reverse
  --color hl:011,fg+:015,bg+:-1,hl+:011
  --prompt='❯ '
  --pointer='▶'
  --marker='│'
"

#Less
export LESSHISTFILE=-
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# ------------------ Functions ------------------

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
      open "$(basename "$selected")"
  fi
}
bind '"\C-f":"\C-uff\n"'

function mcdir() {
  mkdir "$1"
  cd "$1" || return
}


# ------------------ Aliases ------------------

alias la='ls -vla' 
alias l='ls -AH'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -ir'
alias b='cd - >/dev/null'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dot="cd ~/.dotfiles"
alias tam='tmux attach -t main'
alias tnm='tmux new -s main'
alias tks='tmux kill-server'
alias n='nvim'
alias ntrash='cd ~/.local/share/nvim/mini.files/trash'
alias py='python3'
alias pip='pip3'
alias path='echo -e ${PATH//:/\\n}'
alias week='date +%V'
alias g='git'
alias cpath='pwd | pbcopy'


# ------------------- Prompt -------------------

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
