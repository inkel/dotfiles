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

# for Git completion
if [ -f /etc/bash_completion.d/git-completion.bash ]; then
    source /etc/bash_completion.d/git-completion.bash
fi
