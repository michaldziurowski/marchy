# run only if you have additional user

sudo pacman -S sddm
sudo systemctl enable sddm
# since 3.1 omarchy no longer uses omarchy-seamless-login 
# sudo systemctl disable omarchy-seamless-login

# as a additional user:
#symlink ~/.local/share/fonts
#fc-cache

yay -S sddm-silent-theme

sudo rm /etc/sddm.conf.d/autologin.conf

#and in /etc/sddm.conf.d/sddm.conf (ofc without # ;) )
#[General]
#InputMethod=qtvirtualkeyboard
#GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard
#
#[Theme]
#Current=silent
