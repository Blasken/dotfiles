# load configs in ~/.config/zsh/
autoload -U colors && colors
#autoload -U run-help
#autoload run-help-git
#autoload run-help-svn
##autoload run-help-svk
#unalias run-help
#alias help=run-help

#umask 077
#ZDOTDIR=${ZDOTDIR:-${HOME}}
ZSHDDIR="${HOME}/.config/zsh"
NPM_PACKAGES="${HOME}/.npm-global"

typeset -U path

export TMP="/tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"
export VDPAU_DRIVER="nvidia"
export LIBVA_DRIVER_NAME="vdpau"
export MYVIMRC="${HOME}/.vimrc"
export MYNVIMRC="${HOME}/.config/nvim/init.vim"
#export ANDROID_HOME="~/Android/Sdk"
export CUDA_ROOT="/opt/cuda"

export CPATH="${HOME}/.local/include"
#export PATH="${HOME}/.local/include:${PATH}"
path=(
    "${HOME}/.local/include"
    "${HOME}/.local/bin"
    "${HOME}/bin"
    "${CUDA_ROOT}/bin"
    "${NPM_PACKAGES}/bin"
#    "$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
    "$path[@]"
)

typeset -T LD_LIBRARY_PATH ld_library_path
typeset -U ld_library_path
ld_library_path+=(
    "$HOME/.local/lib"
    "$CUDA_ROOT/lib64"
)

typeset -T LIBRARY_PATH library_path
typeset -U library_path
library_path+=(
    "$HOME/.local/lib"
    "$CUDA_ROOT/lib64"
)

#export LIBRARY_PATH="${HOME}/.local/lib:${LIBRARY_PATH}"
#export LIBRARY_PATH="/opt/cuda/lib64:${LIBRARY_PATH}"
#export LD_LIBRARY_PATH="${HOME}/.local/lib:${LD_LIBRARY_PATH}"
#export LD_LIBRARY_PATH="/opt/cuda/lib64:${LD_LIBRARY_PATH}"
export XDG_CACHE_HOME="${HOME}/.cache"

unset MANPATH
export MANPATH="${NPM_PACKAGES}/share/man:$(manpath)"

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# extended globbing, awesome!
setopt extendedGlob

# zmv -  a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst


for config ("${ZSHDDIR}"/*.zsh) source $config
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Completion.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

#tmuxinator completion
#source "${HOME}/.gem/ruby/2.3.0/gems/tmuxinator-0.9.0/completion/tmuxinator.zsh"

# Nobody need flow control anymore. Troublesome feature.
#stty -ixon
setopt noflowcontrol
setopt AUTO_CD
setopt AUTO_PUSHD

bindkey -v
# Keys.
case $TERM in
    rxvt*|xterm*)
        bindkey "^[[7~" beginning-of-line #Home key
        bindkey "^[[8~" end-of-line #End key
        bindkey "^[[3~" delete-char #Del key
        bindkey "^[[A" history-beginning-search-backward #Up Arrow
        bindkey "^[[B" history-beginning-search-forward #Down Arrow
        bindkey "^[Oc" forward-word # control + right arrow
        bindkey "^[Od" backward-word # control + left arrow
        bindkey "^H" backward-kill-word # control + backspace
        bindkey "^[[3^" kill-word # control + delete
    ;;

    linux)
        bindkey "^[[1~" beginning-of-line #Home key
        bindkey "^[[4~" end-of-line #End key
        bindkey "^[[3~" delete-char #Del key
        bindkey "^[[A" history-beginning-search-backward
        bindkey "^[[B" history-beginning-search-forward
    ;;

    screen|screen-*)
        bindkey "^[[1~" beginning-of-line #Home key
        bindkey "^[[4~" end-of-line #End key
        bindkey "^[[3~" delete-char #Del key
        bindkey "^[[A" history-beginning-search-backward #Up Arrow
        bindkey "^[[B" history-beginning-search-forward #Down Arrow
        bindkey "^[Oc" forward-word # control + right arrow
        bindkey "^[OC" forward-word # control + right arrow
        bindkey "^[Od" backward-word # control + left arrow
        bindkey "^[OD" backward-word # control + left arrow
        bindkey "^H" backward-kill-word # control + backspace
        bindkey "^[[3^" kill-word # control + delete
    ;;
esac

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
