#!bash

case $- in
    *i*) ;; # interactive
    *) return ;;
esac

# ======================== local utilities ====================================

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ========================= default programs export ============================

export EDITOR="vim"
export TERMINAL="st"
export BROWSER="brave"

# ========================= environment variables =============================

export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export REPOS="$HOME/repos"
export GHREPOS="$REPOS/github.com/$USER"
export LYNX_CFG="${XDG_CONFIG_HOME:-$HOME/.config}/lynx/lynx.cfg"
export HELP_BROWSER=lynx
export DESKTOP="$HOME/"
export DOCUMENTS="$HOME/dox"
export DOWNLOADS="$HOME/dl"
export TEMPLATES="$HOME/temp"
export PUBLIC="$HOME/pub"
export PRIVATE="$HOME/private"
export PICTURES="$HOME/pix"
export MUSIC="$HOME/music"
export VIDEOS="$HOME/vids"
export VISUAL=vim
export EDITOR_PREFIX=vim
export LC_COLLATE=C
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m"  # underline

# =========================== cd path ===================================

export CDPATH=".:$GHREPOS:$REPOS:$HOME"

# ================== home directory cleanup & paths export ==========================

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GHREPOS/dot/scripts"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
#export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export LESSHISTFILE="-"
export HISTFILE="${XDG_DATE_HOME:-$HOME/.local/share}/history"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
# other programs
export FZF_DEFAULT_OPTS="--layout=reverse --height 40% --border"

# ================================== bash shell options ================================================

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar       # matches all the directories and subdirectories with the tab key
shopt -s dotglob
shopt -s extglob        # the extended pattern matching features
shopt -s dotglob        # includes filenames beginning with a `.' in the results of pathname expansion
shopt -s extglob        # extended pattern matching features

# ================================== history ==================================================

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# ================================== bash prompt ==========================================

__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double\
    red='\[\033[31m\]' black='\[\033[30m\]' blue='\[\033[34m\]' \
    yellow='\[\033[33m\]' purple='\[\033[35m\]' \
    cyan='\[\033[36m\]' r='\[\033[0m\]' dim='\[\033[2;37m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="$purple:$r$red$B$r"

  #prompt="[$dim\w$r]$B \n$blue[\!]$r $P "

  # A simple one liner prompt with only directory information and git status
  prompt="$dim\W$r$B $P "
    PS1="$prompt"
}

PROMPT_COMMAND="__ps1"

# ================================== keyboard =============================================

_have setxkbmap && test -n "$DISPLAY" && \
	setxkbmap -option caps:escape &>/dev/null
_have xset && test -n "$DISPLAY" && \
	xset r rate 200 40

# ================================== bash & gh completion ======================================

_source_if "$GHREPOS/dot/bash/bash_completion"
_source_if "$GHREPOS/dot/gh/gh-completion"

# =================================== aliases ==============================================

unalias -a
# === ls commands ===
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lah'
# === git aliases ===
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push origin $(git branch --show-current)'
# === Navigation ===
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
# === grep aliases ===
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias '?'=duck
alias '??'=google
alias chmox='chmod +x'
alias free='free -h'
alias cl='printf "\e[H\e[2J"'
#alias for wget which resumes downloads
alias wget='wget -c'

_have vim && alias vi=vim

# checks if the booted tty is 1 and then executes `X' if it has `X'
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
