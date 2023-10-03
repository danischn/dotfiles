#Options 
autoload -U colors && colors
autoload -Uz vcs_info
setopt promptsubst

#Git 
zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:*:*' formats " %{$fg[blue]%}(%{$fg[red]%}%b%{$fg[blue]%)"

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

PROMPT='%{$fg[cyan]%}%~${vcs_info_msg_0_} %{$fg[green]%}➜ '
