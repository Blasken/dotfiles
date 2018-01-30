alias -g cp="cp -ivr"
alias -g grep='grep --colour=auto'
alias -g l="ls -lhF --color=auto --group-directories-first --full-time"
alias -g la="ls -lahF --color=auto --group-directories-first"
alias -g mv='mv -iv'
alias -g rm='rm -iv'
alias -g scp="scp -vr"
alias -g pacman='sudo pacman'
alias -g checktemp='while :; do sensors; sleep 1 && clear; done;'
alias -g tmatlab='terminal_matlab'
alias -g wttr='curl wttr.in/göteborg'
alias -g vim='nvim'

alias -s {avi,mpg,mp4,mpeg,mkv,flv,wmv,ogv}=$PLAYER

if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi

alias dusys='du -x -m -d 2 -a /usr/share --time | sort -n -r | head -n 30'

_dusys()
{
    echo '#this is not implemented'
}

_better_ls() {
    echo "$*";
}
