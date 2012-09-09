# -*- shell-script -*-

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

PATH="/usr/local/Cellar/ruby/1.9.3-p194/bin"
PATH="${PATH}:/usr/local/bin:/usr/local/sbin"
PATH="${PATH}:${HOME}/bin"
PATH="${PATH}:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="${PATH}:/opt/X11/bin:/usr/X11/bin"
export PATH

export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim

export GREP_OPTIONS="--color=auto"

export EDITOR="emacsclient --alternate-editor='' --tty"

# PS1
_gs_ps1() {
    [[ -z $GS_NAME ]] || echo "[$GS_NAME] "
}

source /usr/local/share/git-core/contrib/completion/git-prompt.sh

export PS1="\n\[\033[01;32m\]\w \[\033[1;33m\]\$(_gs_ps1)\[\033[01;31m\]\$(__git_ps1 \"(%s) \")\[\033[01;36m\]>>\[\033[00m\] "
export PS1="\[\033[G\]$PS1"

# Aliases
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'

alias e=$EDITOR

# Stupid Ubuntu
[[ -n $(which ack-grep) ]] && alias ack='ack-grep'

# Shell configuration

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls
[[ -x /usr/bin/dircolors ]] && eval "`dircolors -b`"

# Completion
for c in git-completion.bash bash-builtins
do
    if [[ -f /usr/local/etc/bash_completion.d/$c ]]; then
        source /usr/local/etc/bash_completion.d/$c
    elif [[ -f /etc/bash_completion.d/$c ]]; then
        source /etc/bash_completion.d/$c
    fi
done

__ssh_hosts() {
    sort <([[ -f ~/.ssh/known_hosts ]] && awk '/^[a-zA-Z0-9]/ { print $1 }' ~/.ssh/known_hosts) \
        <([[ -f ~/.ssh/config ]] && awk '/^Host(Name)? / { print $2 }' ~/.ssh/config) | grep -v \*
}

__ssh() {
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"
    if [[ ! $cur == -* ]]; then
        COMPREPLY=( $(compgen -W "$(__ssh_hosts)" -- $cur) )
        return 0
    fi
}

complete -o bashdefault -o default -o nospace -F __ssh ssh scp 2> /dev/null \
    || complete -o default -o nospace -F __ssh ssh scp
