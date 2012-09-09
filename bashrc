# -*- shell-script -*-

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

. "${HOME}/.bashrc.d/variables"
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
