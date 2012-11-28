#! /usr/bin/env bash

ORIGIN=$(dirname $0)

[[ -z $1 ]] && DST=$HOME || DST=$1

echo "Installing dotfiles from ${ORIGIN} to ${DST}"

DOTFILES="
ackrc
bash_login
bashrc
bashrc.d/colors
gemrc
gitconfig.sample
gitignore
inputrc
profile
pryrc
tmux.conf
"

mkdir -p "${DST}/.bashrc.d"

DIFF=$(which colordiff || which diff)

for dotfile in $DOTFILES
do
    origin="${ORIGIN}/${dotfile}"
    destination="${DST}/.${dotfile}"
    if [[ "gitconfig.sample" == $dotfile ]]; then
        destination="${DST}/.gitconfig"
    fi

    if [[ -f $destination || -L $destination ]]; then
        echo "Skipping $origin: $destination exists"

       [[ -f $destination ]] && $DIFF "$origin" "$destination"
    else
        echo "Symlinking $origin to $destination"
        /bin/ls -s "$origin" "$destination"
    fi
done
