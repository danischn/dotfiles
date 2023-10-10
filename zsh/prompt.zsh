#Options 
autoload -U colors && colors
autoload -Uz vcs_info
setopt promptsubst

#Git 
zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' formats " %{$fg[blue]%}(%{$fg[red]%}%b%{$fg[blue]%)%c"


#Cursor shape
zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
    # the command mode for vi
    echo -ne "\e[2 q"
  else
    # the insert mode for vi
    echo -ne "\e[6 q"
  fi
}
zle -N zle-keymap-select
echo -ne "\e[6 q" # Use beam shape cursor on startup.

precmd() { vcs_info }

PROMPT='%B%{$fg[cyan]%}%1~%b${vcs_info_msg_0_} %{$fg[green]%}➜ '
