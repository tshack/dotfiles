#!/usr/bin/env bash

# Get dotfiles dir (this script can be ran from anywhere)
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# Update dotfiles itself via git
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Flag: safe
# Allow for single thread vim-plug install for accounts with process quoata
if [ "$1" == "safe" ]
then
    SAFE_MODE=true
fi

# Can we use sudo?
groups | grep sudo > /dev/null
if [ $? == 0 ]; then
    HAVE_SUDO=true
fi

# Do we have apt?
if which apt-get > /dev/null
then
    HAVE_APT=true
fi

source $DOTFILES_DIR/fonts/install
source $DOTFILES_DIR/vim/install
source $DOTFILES_DIR/tmux/install
source $DOTFILES_DIR/git/install
source $DOTFILES_DIR/latex/install
#source $DOTFILES_DIR/zsh/install
