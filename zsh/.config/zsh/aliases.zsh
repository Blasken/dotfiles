alias cp="cp -ivr"
alias grep='grep --colour=auto'
alias l="ls -lhF --color=auto --group-directories-first --full-time"
alias la="ls -lahF --color=auto --group-directories-first"
alias mv='mv -iv'
alias rm='rm -iv'
alias scp="scp -vr"
alias pacman='sudo pacman'
alias checktemp='while :; do sensors; sleep 1 && clear; done;'
alias tmatlab='terminal_matlab'
alias wttr='curl wttr.in/göteborg'
alias vim='nvim'

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
