function log_error {
    local MSG=$1
    ERRORS=("${ERRORS[@]}" "- $MSG")
}

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

function probe_capabilities {
    if [ ! have_sudo ]; then
        log_error "No sudo privilage"
    fi
    if [ ! have_apt ]; then
        log_error "No Advanced Package Tool (APT)"
    fi
    if [ ! can_install ]; then
        log_error "Unable to install things"
    fi
}

function install_package {
    local PKG=$1
    dpkg-query -s $PKG > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        if [ can_install ]; then
            sudo apt-get install $PKG
            if [ $? -ne 0 ]; then
                log_error "Failed to install package: $PKG"
            fi
        else
            log_error "Unable to install package: $PKG"
        fi
    else
        return
    fi
}

function install_symlink {
    local SOURCE_FILE=$1
    local TARGET_FILE=$2
    SOURCE_FILE=$(readlink -e $DOTFILES_DIR/$SOURCE_FILE)

    ln -sfv "$SOURCE_FILE" "$TARGET_FILE"
    if [ $? -ne 0 ]; then
        log_error "Symlink failure: $SOURCE_FILE -> $TARGET_FILE"
    fi
}
