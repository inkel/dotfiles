# -*- shell-script -*-

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

. "${HOME}/.bashrc.d/variables"
. "${HOME}/.bashrc.d/prompt"
. "${HOME}/.bashrc.d/misc"
. "${HOME}/.bashrc.d/history"
. "${HOME}/.bashrc.d/colors"
. "${HOME}/.bashrc.d/aliases"
. "${HOME}/.bashrc.d/completion"
. "${HOME}/.bashrc.d/git_prompt" && use_git_normal_prompt

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# for RVM completion
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

export PS1="\n\[\033[01;32m\]\w\[\033[00;33m\] \[\033[0;31m\]\$(~/.rvm/bin/rvm-prompt)\n\[\033[01;31m\]\$(__git_ps1 \"(%s) \")\[\033[01;36m\]>>\[\033[00m\] "

# for Git completion
if [ -f /etc/bash_completion.d/git-completion.bash ]; then
    source /etc/bash_completion.d/git-completion.bash
fi
