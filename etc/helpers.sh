function have_sudo {
    groups | grep sudo > /dev/null 2>&1
    if [ $? == 0 ]; then
        return 0
    else
        return 1
    fi
}

function have_apt {
    if which apt-get > /dev/null; then
        return 0
    else
        return 1
    fi
}

function can_install {
    if [ have_sudo ] && [ have_apt ]; then
        return 0
    else
        return 1
    fi
}

function install_package {
    local PKG=$1
    dpkg-query -s $PKG > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        if [ can_install ]; then
            sudo apt-get install $PKG
        fi
    else
        return
    fi
}

function install_symlink {
    # TODO: Check for errors in here and build an array
    #       of symlink requests that failed -- for reporting
    #       at the end of install.sh
    local SOURCE_FILE=$1
    local TARGET_FILE=$2
    SOURCE_FILE=$(readlink -e $DOTFILES_DIR/$SOURCE_FILE)

    ln -sfv "$SOURCE_FILE" "$TARGET_FILE"
}
