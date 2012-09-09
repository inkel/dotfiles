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

. "${HOME}/.bashrc.d/misc"
. "${HOME}/.bashrc.d/history"
. "${HOME}/.bashrc.d/colors"
. "${HOME}/.bashrc.d/aliases"
. "${HOME}/.bashrc.d/completion"
. "${HOME}/.bashrc.d/git_prompt" && use_git_normal_prompt

# for Git completion
if [ -f /etc/bash_completion.d/git-completion.bash ]; then
    source /etc/bash_completion.d/git-completion.bash
fi

# PS1
_gs_ps1() {
    [[ -z $GS_NAME ]] || echo "[$GS_NAME] "
}

source /usr/local/share/git-core/contrib/completion/git-prompt.sh

export PS1="\n\[\033[01;32m\]\w \[\033[1;33m\]\$(_gs_ps1)\[\033[01;31m\]\$(__git_ps1 \"(%s) \")\[\033[01;36m\]>>\[\033[00m\] "
export PS1="\[\033[G\]$PS1"
