unset beep
set nobeep
bindkey -M viins 'jk' vi-cmd-mode
zle -N inc_int _inc_dec_int
bindkey -M vicmd '^a' inc_int
zle -N dec_int _inc_dec_int
bindkey -M vicmd '^x' dec_int

wheres_my_space() {
    # for file in ${lostfiles strict}
}
