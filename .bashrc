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
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export LC_COLLATE=C
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"
export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m"  # underline

# ================================== home directory cleanup ===========================================

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
#export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export LESSHISTFILE="-"
export HISTFILE="${XDG_DATE_HOME:-$HOME/.local/share}/history"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
# other programs
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# ================================== bash shell options ================================================

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

# ================================== history ==================================================

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# ================================== bash prompt ==========================================

__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double\
    r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="\e[2;37m:\e[0m\e[1;31m$B\e[0m"

  prompt="\e[2;37m\W\e[0m$B \$ "
PS1="$prompt"
}

PROMPT_COMMAND="__ps1"

# ================================== keyboard =============================================

_have setxkbmap && test -n "$DISPLAY" && \
	setxkbmap -option caps:escape &>/dev/null
_have xset && test -n "$DISPLAY" && \
	xset r rate 200 40

# ================================== bash completion ======================================

_source_if "$PWD/bash/bash_completion"

# =================================== aliases ==============================================

unalias -a
# ls commands
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lah'
alias c='clear'
# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin main'
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
# grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias '?'=duck
alias chmox='chmod +x'
alias free='free -h'
alias c='printf "\e[H\e[2J"'

_have vim && alias vi=vim

# =================================== TMUX on every new startup shell ======================

#[[ $- == *i* ]] && [[ -z "${TMUX}" ]] && { tmux attach || exec tmux new-session && return ; }
