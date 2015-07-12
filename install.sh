#!/usr/bin/env bash

# Get dotfiles dir (this script can be ran from anywhere)
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# First update dotfiles via git
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Helper functions
source $DOTFILES_DIR/etc/helpers.sh

# Run all the installers
for installer in $DOTFILES_DIR/*/install
do
    source $installer
done
