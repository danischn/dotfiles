#!/bin/bash

# ---------------- miscellaneous  ---------------

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH=~/dotfiles/scripts/:$PATH
export EDITOR="nvim"
export CLICOLOR=
export LSCOLORS='exfxcxdxbxegedabagacad'  # Colors (https://geoff.greer.fm/lscolors/)
export LANG="en_US.UTF-8"
export LESSHISTFILE=-
export PAGER="less"
export MANPAGER='less --use-color'
eval "$(/opt/homebrew/bin/brew shellenv)" # Setup homebrew

#Remove dups from path (https://stackoverflow.com/questions/44232009/how-to-handle-duplicates-in-my-path-variable)
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')" 

# ------------------- history -------------------

HISTSIZE=1048576
HISTFILESIZE=$HISTSIZE
HISTFILE=$XDG_STATE_HOME/bash/history
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# ------------------- fzf -----------------------

export FZF_DEFAULT_OPTS="
  --layout=reverse
  --color hl:011,fg+:015,bg+:-1,hl+:011,border:#ffffff
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
      open "$(basename "$selected")"
  fi
}
bind '"\C-f":"\C-uff\n"'

function mcdir() {
  mkdir "$1"
  cd "$1" || return
}


# ------------------ aliases ------------------

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
