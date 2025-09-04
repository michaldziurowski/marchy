# run only if you have additional user

sudo pacman -S sddm
sudo systemctl enable sddm
sudo systemctl disable omarchy-seamless-login

# as a additional user:
#symlink ~/.local/share/fonts
#fc-cache

yay -S sddm-silent-theme

#and in /etc/sddm.conf (ofc without # ;) )
#[General]
#InputMethod=qtvirtualkeyboard
#GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard
#
#[Theme]
#Current=silent
