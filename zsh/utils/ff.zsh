#!/usr/bin/env zsh
#Requirements:
#fd and fzf

ff() {
  # List of file types to open with 'open'
  local open_filetypes=("pdf" "jpg" "png" "docx")  # Add more file types as needed

  local editor="${EDITOR:?EDITOR variable not set or empty}"
  local fzf_options=(
    "-p80%"
    "--ansi"
    "--read0"
    "--print0"
    "--exit-0"
  )
  local fd_options=(
      "--hidden"
      "--follow"
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
  )


  # Use ANSI escape codes to colorize the output
  # Blue for directories, green for files, red for PDFs
  # Define color variables

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

  # Strip the null character from the selected item
  selected_item=${selected_item%%$'\0'}

  # Strip the ANSI escape codes from the selected item
  selected_item=$(echo -e "$selected_item" | sed 's/\x1b\[[0-9;]*m//g')

  # Extract the file extension
  local filetype=${selected_item##*.}

  # If the user escapes after pressing ctrl + f, we return.
  if [[ -z $selected_item ]]; then
    return 0
  fi

  # Do the appropriate thing.
  if [[ -d $selected_item ]]; then
    cd -- "$(realpath "$selected_item")"
  elif [[ " ${open_filetypes[@]} " =~ " ${filetype} " ]]; then
    open "$selected_item"
  else
    "$editor" "$selected_item"
  fi
}

# Bind ^f to the ff script
function ff-widget {
  ff
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done
  zle reset-prompt
}
zle -N ff-widget
bindkey "^f" ff-widget
