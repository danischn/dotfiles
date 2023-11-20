# ----------------------- environment variables ----------------------
# Set the XDG_*_HOME environment variables
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

export EDITOR="nvim"
export FZF_DEFAULT_OPTS="--layout=reverse"
export FZF_TMUX_OPTS="-p60%"

# History 
export HISTSIZE=1048576
export HISTFILESIZE=$HISTSIZE
export HISTFILE="${XDG_DATA_HOME}/state/bash/history"
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# Less
# https://www.tecmint.com/view-colored-man-pages-in-linux/
export LESSHISTFILE=-
export LESS_TERMCAP_mb=$'\e[1;32m' #green
export LESS_TERMCAP_md=$'\e[1;32m' #green
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# --------------------------- path ---------------------------------

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.dotfiles/scripts/:$PATH"

# --------------------------- prompt ---------------------------------

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

export PS1="${cyan}\w${purple}\$(git_branch)\$(git_dirty) ${reset}➜ "

# ----------------------------- functions ----------------------------

function ff(){
  fd_options=( --hidden --follow --color always --exclude Library --exclude Music --exclude Movies --exclude Public --exclude Desktip --exclude Applications --exclude Pictures --exclude .cache --exclude .local --exclude .m2 --exclude .idlerc --exclude .Trash --exclude .Applications --exclude .ssh --exclude .vscode --exclude .config --exclude .DS_Store --exclude .npm --exclude .git)

  selected_raw=$(fd "${fd_options[@]}" | fzf-tmux -p60% --ansi)
  if [ -z "$selected_raw" ]; then return 0; fi

  selected_dir=$(realpath "${selected_raw%/*}")
  selected_file=$(basename "$selected_raw")
  last_char=${selected_raw: -1}

  if [ "$last_char" = '/' ]; then
    cd "$selected_dir" 
  else 
    cd "$selected_dir" 2>/dev/null
    "$EDITOR" "$selected_file"
  fi
}
bind '"\C-f":"\C-uff\n"'

function lfcd() {
    cd "$(command lf -print-last-dir "$@")"
}

function mcdir() {
  mkdir "$1" && cd "$1"
}

# ----------------------------- aliases --------------------------
alias la='ls -v -la --color=auto '
alias l='ls -AH --color=auto'
alias ls='ls --color=auto'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -Ir'
alias b='cd - >/dev/null'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dot="cd ~/.dotfiles"
alias udot="g commit -am 'update' >/dev/null ; g push"
alias notes="cd ~/Documents/notes && nvim index.md"
alias tam='tmux attach -t main'
alias tnm='tmux new -s main'
alias tks='tmux kill-server'
alias nc='cd ~/.dotfiles/nvim && nvim'
alias n='nvim'
alias ntrash='cd ~/.local/share/nvim/mini.files/trash'
alias py='python3'
alias pip='pip3'
alias r='ranger'
alias path='echo -e ${PATH//:/\\n}'
alias week='date +%V'
alias g='git'
alias lf='lfcd'
