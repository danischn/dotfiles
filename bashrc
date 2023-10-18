# ----------------------- environment variables ----------------------

export PATH="/opt/homebrew/bin:$PATH"
export EDITOR="nvim"
export FZF_DEFAULT_OPTS="--layout=reverse"
export FZF_TMUX_OPTS="-p60%"
export LESSHISTFILE=-
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTFILE="$XDG_STATE_HOME"/bash/history

# --------------------------- prompt ---------------------------------

export PROMPT_DIRTRIM=3

#Colors
reset="\e[0m"
cyan="\e[36m"
purple="\e[35m"

# get current branch in git repo
function git_branch(){
  git branch 2>/dev/null | grep '^*' | sed 's/* //'
}

export PS1="${cyan}\w ${purple}\$(git_branch) ${reset}$ "

# ----------------------------- functions ----------------------------

function ff(){
  fd_options=( --hidden --follow --color always --exclude Library --exclude Music --exclude Movies --exclude Public --exclude Desktip --exclude Applications --exclude Pictures --exclude .cache --exclude .local --exclude .m2 --exclude .idlerc --exclude .Trash --exclude .Applications --exclude .ssh --exclude .vscode --exclude .config --exclude .DS_Store --exclude .npm --exclude .git)

  selected_raw=$(fd "${fd_options[@]}" | fzf-tmux -p60% --ansi)
  selected_dir=$(echo "$selected_raw" | sed 's/\(.*\/\)[^/]*$/\1/')
  selected_file=$(echo "$selected_raw" | sed 's/.*\///')
  last_char=${selected_raw: -1}

  if [ -z "$selected_raw" ]; then
      return 0
  fi

  if [ "$last_char" = '/' ]; then
    cd "$selected_dir" 
  else 
    cd "$selected_dir"
    "$EDITOR" "$selected_file"
  fi
}
bind '"\C-f":"ff\n"'


# ----------------------------- aliases ----------------------------

alias l='ls -AH --color=auto'
alias ls='ls --color=auto'
alias la='ls -ahlF --color=auto'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias b='cd - >/dev/null'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dot="cd ~/.dotfiles"
alias wiki="cd ~/Documents/wiki"
alias tam='tmux attach -t main'
alias tnm='tmux new -s main'
alias tks='tmux kill-server'
alias nc='cd ~/.dotfiles/nvim && nvim'
alias n='nvim'
alias ntrash='cd ~/.local/share/nvim/mini.files/trash'
alias py='python3'
alias r='ranger'
alias path='echo -e ${PATH//:/\\n}'
alias week='date +%V'
alias g='git'
