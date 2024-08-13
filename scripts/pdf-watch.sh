#!/bin/bash

echo "Change in ~/Downloads at $(date +'%M:%S.%3N')" >> ~/pdf-watch.log

renamed_file=$(fd --base-directory ~/Downloads -e pdf | tofi -c ~/dotfiles/tofi/pdf-config)
echo $

sleep 1
