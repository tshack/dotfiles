#!/usr/bin/env bash

# Get dotfiles dir (this script can be ran from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Errors encountered during installation are logged to
# this bash array via log_error() from etc/helpers.sh
ERRORS=()

# First update dotfiles via git
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Helper functions
source $DOTFILES_DIR/etc/helpers.sh
probe_capabilities

# If a specific installer is specified, run only it;
# otherwise, just install everything
if [ -z $1 ]
then
    # Run all the installers
    for installer in $DOTFILES_DIR/*/install
    do
        source $installer
    done
else
    # Run specified installer (if it exists)
    INSTALLER=$DOTFILES_DIR/$1/install
    if [ -e $INSTALLER ]
    then
        source $INSTALLER
    else
        log_error "Invalid installer specified"
    fi
fi

# Report any errors
echo "====================================="
echo "  Installation Complete: [${#ERRORS[@]} Errors]"
echo "====================================="
for msg in "${ERRORS[@]}"
do
    echo $msg
done
