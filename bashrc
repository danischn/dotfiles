#!/bin/bash

# ---------------- miscellaneous  ---------------
export EDITOR="nvim"
export PAGER="less"
export MANPAGER='nvim +Man!'
eval "$(dircolors -b "$HOME/dotfiles/dircolors")"

# ------------------- options  ------------------
shopt -s checkwinsize

# -------------------  clean ~ ------------------
 
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
  --color hl:#F27900,hl+:#F27900,fg+:-1,bg+:-1,border:#1A1918 
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
  fd_options=(--follow --color=always --no-ignore-vcs)
  exclude_dirs=(
    Library
    Music
    Movies
    Public
    Desktop
    Applications
    Pictures
  )

  for dir in "${exclude_dirs[@]}"; do
    fd_options+=( --exclude "$dir")
  done

  selected=$(fd "${fd_options[@]}" | fzf-tmux -p50%,30% --ansi)
  if [ -z "$selected" ]; then return; fi

  filetype=$(file --mime-type -b "$selected")

  if [[ $filetype == "inode/directory" ]]; then
      cd "$selected" || return
  elif [[ $filetype == text/* || $filetype == application/* || $filetype == inode/x-empty ]]; then
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

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls='ls -hF --color=auto --group-directories-first'
alias l='ls -lahF --color=auto --group-directories-first'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -ir'
alias b='cd - >/dev/null'
alias tam='tmux attach -t main'
alias tnm='tmux new -s main'
alias tks='tmux kill-server'
alias ntrash='cd ~/.local/share/nvim/mini.files/trash'
alias week='date +%V'
alias py='python'
alias rpdf='fdupes -rdN ~/Downloads'
# ------------------- prompt -------------------

PROMPT_DIRTRIM=3

# Get current branch in git repo
function git_branch(){
  git branch 2>/dev/null | grep '^*' | sed 's/*//'
}

function git_dirty(){
  [[ -z $(git status -s 2>/dev/null) ]] || echo '?'
}

# Define the color codes for bold text and blue color
RESET='\[\033[0m\]'
PURPLE='\[\033[1;35m\]'
BLUE='\[\033[1;34m\]'

# Update the PS1 variable with bold formatting
PS1="$BLUE\w${PURPLE}\$(git_branch)\$(git_dirty) ${RESET}➜ "
