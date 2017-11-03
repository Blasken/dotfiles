#
# ~/.zprofile
#

eval $(keychain --eval --agents ssh id_rsa aur)
#export TERMINAL=termite
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt$XDG_VTNR -nolisten tcp
