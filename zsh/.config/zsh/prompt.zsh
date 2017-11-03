# color userlevel
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
    USER_LEVEL=""
else # root!
    USER_LEVEL="${fg_blue}%n"
fi

autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr "${fg_blue}?"
zstyle ':vcs_info:*' unstagedstr "${fg_brown}?"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats "${at_normal} ${fg_dgray}%b%c%u${at_normal}"
    } else {
        zstyle ':vcs_info:*' formats "${at_normal} ${fg_dgray}%b%c%u${fg_red}!${at_normal}${fg_white}"
    }
    vcs_info
}

# allow functions in the prompt
setopt PROMPT_SUBST
PROMPT="%B%F{green}%{$reset_color%}${at_normal}%f%b " # "
RPROMPT="%B%F{green}[ %c\${vcs_info_msg_0_} %(?/${at_normal}/${fg_red})%B%F{green}]%f%b" #%{$fg_no_bold[yellow]%}%?${fg_white}]"

set_prompt_color() {
    if [[ $TERM = "linux" ]]; then
        # nothing
    elif [[ $TMUX != '' ]]; then
        printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
    else
        echo -ne "\033]12;$1\007"
    fi
}
