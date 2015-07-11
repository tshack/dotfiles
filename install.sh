#!/usr/bin/env bash

# Get dotfiles dir (this script can be ran from anywhere)
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# Update dotfiles itself via git
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

source $DOTFILES_DIR/fonts/install
source $DOTFILES_DIR/vim/install
source $DOTFILES_DIR/tmux/install
#source $DOTFILES_DIR/zsh/install
