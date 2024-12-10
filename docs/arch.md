# Hide Desktop Entries from Tofi
[link](https://wiki.archlinux.org/title/Desktop_entries)
```
cp -r /usr/share/applications/ ~/.local/share/applications/
cd ~/.local/share/applications/
ls *.desktop | xargs -I {} sh -c 'echo "NoDisplay=true" >> "{}" && echo "Added to {}"' 
```
then remove the NoDisplay=true from the applications you want to see
