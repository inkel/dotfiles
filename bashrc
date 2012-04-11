# -*- shell-script -*-
bm() {
    echo "$*"
    time $*
}
# BM="bm"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

$BM . "${HOME}/.bashrc.d/variables"
$BM . "${HOME}/.bashrc.d/prompt"
$BM . "${HOME}/.bashrc.d/misc"
$BM . "${HOME}/.bashrc.d/history"
$BM . "${HOME}/.bashrc.d/colors"
$BM . "${HOME}/.bashrc.d/aliases"
$BM . "${HOME}/.bashrc.d/completion"
# . "${HOME}/.bashrc.d/git_prompt" && use_git_normal_prompt

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && $BM . "$HOME/.rvm/scripts/rvm"
# for RVM completion
# [[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

export PS1="\n\[\033[01;32m\]\w \[\033[1;33m\]\$(~/.rvm/bin/rvm-prompt)\n\[\033[01;31m\]\$(__git_ps1 \"(%s) \")\[\033[01;36m\]>>\[\033[00m\] "
# export PS1_GIT="\n\[\033[01;32m\]\w \[\033[1;33m\]\[\033[01;31m\]\$(__git_ps1 \"(%s) \")\[\033[01;36m\]>>\[\033[00m\] "
# gs_prompt() {
#     [[ -n $GEM_SET ]] && echo "[$GEM_SET]"
# }
# export PS1="\n\[\033[01;32m\]\w \[\033[1;33m\]\$(gs_prompt)\n\[\033[01;31m\]\$(__git_ps1 \"(%s) \")\[\033[01;36m\]>>\[\033[00m\] "

# export PS1="\n\[\033[01;32m\]\w \[\033[1;33m\]\[\033[01;36m\]>>\[\033[00m\] "

# if [ -f `brew --prefix`/etc/bash_completion ]; then
#     $BM . `brew --prefix`/etc/bash_completion
# fi

# for Git completion
# if [ -f /etc/bash_completion.d/git-completion.bash ]; then
#     $BM source /etc/bash_completion.d/git-completion.bash
# fi

for c in git-completion.bash
do
    $BM . /usr/local/etc/bash_completion.d/$c
done

export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

# Hack path
PATH="/usr/local/bin:/usr/local/sbin:$(echo $PATH | sed 's!/usr/local/bin!!g')"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

ut ()
{
    uptime | sed -E 's/^.+: ([0-9. ]+)$/\1/'
}
