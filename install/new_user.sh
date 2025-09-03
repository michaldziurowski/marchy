# run only if you have additional user

sudo pacman -S sddm
sudo systemctl enable sddm
sudo systemctl disable omarchy-seamless-login

# as a additional user:
#symlink ~/.local/share/fonts
#fc-cache
