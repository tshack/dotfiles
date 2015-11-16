# virtualenv.zsh
#
#   Simply source in virtualenvwrapper.sh if it
#   exists on the system.
#
##################################################

VIRTUAL_ENV_WRAPPER="/usr/local/bin/virtualenvwrapper.sh"
if [ -f $VIRTUAL_ENV_WRAPPER ]
then
    source $VIRTUAL_ENV_WRAPPER
fi
