nav() {
  local fd_options=(
    "--hidden"
    "--follow"
    "--print0"
    "--exclude=.cache"
    "--exclude=.local"
    "--exclude=.npm"
    "--exclude=Library"
    "--exclude=.DS_Store"
    "--exclude=.git"
    "--exclude=Pictures"
    "--exclude=Movies"
    "--exclude=.Trash"
    "--exclude=.m2"
    "--exclude=.vscode"
    "--exclude=.rustup"
    "--exclude=Music"
    "--exclude=.zsh_sessions"
    "--exclude=.config"
  )

  local fzf_options=(
    "-p80%"
    "--ansi"
    "--read0"
    "--print0"
    "--exit-0"
  )

  local colorize_script='
    if [[ -d $1 ]]; then
      echo -ne "\033[34m$1\0\033[0m"
    elif [[ $1 == *.pdf ]]; then
      echo -ne "\033[31m$1\0\033[0m"
    else
      echo -ne "\033[32m$1\0\033[0m"
    fi
  '


  local selected_item="$(command fd "${fd_options[@]}" --print0 --exec bash -c "$colorize_script" -- {} | command fzf-tmux "${fzf_options[@]}")"
  local extension=${selected_item##*.}
  local open_filetypes=("pdf" "jpg" "png" "docx" "mp3")

  if [[ -z $selected_item ]]; then 
    return 0 
  elif [[ -d $selected_item ]]; then
    cd $selected_item
  elif [[ " ${open_filetypes[@]} " =~ " ${extension} " ]]; then
    open $selected_item
  else;
    $EDITOR $selected_item
  fi
}
