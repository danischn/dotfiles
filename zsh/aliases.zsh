#Exa
alias l='exa --all --icons'
alias ls='exa --icons'
alias lt='exa --tree'
alias ll='exa --header --long --icons'
alias la='exa --header --long --all --icons'

#General
alias rzsh='source ~/.config/zsh/.zshrc'
alias c='clear'
alias cpath='pwd | pbcopy'

#Cd
alias b='cd - >/dev/null'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias zc="cd ~/.config/zsh"
alias cig="cd ~/.config"
alias dl="cd ~/Downloads"
alias kattis="cd ~/Documents/skole/3.sem/in2010/kattis"
alias dot="cd ~/.dotfiles"
alias wiki="cd ~/Documents/wiki"
alias 2010="cd ~/Documents/skole/3.sem/in2010"

#Vscode
alias vo='code -r .' #open directory in used window

#Java
alias cjava='javac *.java'

#Tmux
alias rtmux='tmux source ~/.config/tmux/tmux.conf'
alias tam='tmux attach -t main'
alias tnm='tmux new -s main'
alias tks='tmux kill-server'

#Nvim
alias nc='cd ~/.config/nvim && nvim'
alias n='nvim'
alias ntrash='cd ~/.local/share/nvim/mini.files/trash'

#Python
alias py='python3'

#Ranger
alias r='ranger'

#Path
alias path='echo -e ${PATH//:/\\n}'

# Get week number
alias week='date +%V'

#ssh uio
alias uio='ssh danischn@login.ifi.uio.no'

#Git
alias gl='git log --all --graph --decorate'
