eval $(keychain --eval --agents ssh id_rsa aur)

export TERMINAL=termite
#export TERMINAL=termite
if [ -z $DISPLAY ] && [ -n $XDG_VTNR ] && [ $XDG_VTNR -eq 1 ]; then
       exec startx
fi
