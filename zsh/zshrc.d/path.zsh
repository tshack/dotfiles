# set PATH so it includes private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes scripts if it exists
if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$PATH"
fi
