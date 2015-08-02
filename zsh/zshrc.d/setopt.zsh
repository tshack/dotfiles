setopt no_beep
setopt interactive_comments

## Changing Directories ###################################################
# typing a directory name without 'cd' still changes working directory
setopt auto_cd
# if the argument to cd is the name of a parameter whose value is a valid
# directory, it will become the current directory
setopt cdablevars
# don't push the same directory onto the dir stack multiple times
setopt pushd_ignore_dups

## Expansion and Globbing #################################################
# treat #,~, and ^ as part of filename generation patterns
setopt extended_glob


## Correction #############################################################
# spelling correction for commands
setopt correct
# spelling correction for arguments
setopt correctall


## Prompt #################################################################
# enable parameter expansion, command substitution, and arithmetic
# expansions
setopt prompt_subst
# remove right prompt when input typed into prompt
setopt transient_rprompt
