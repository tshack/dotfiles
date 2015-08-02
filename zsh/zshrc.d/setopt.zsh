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


## History ################################################################
# allow multiple sessions to append to one zsh history
setopt append_history
# save timestamp of command and duration
setopt extended_history
# don't add commands to history until session ends
setopt no_inc_append_history
# when trimming history, lose oldest dups first
setopt hist_expire_dups_first
# do not write events that are dups of prev events
setopt hist_ignore_dups
# don't write events if first char is a space
setopt hist_ignore_space
# when searching history, don't display dups
setopt hist_find_no_dups
# remove extra spaces before writing to history
setopt hist_reduce_blanks
# whenever the user enters a line with history substitution, don't execute
# the line directly; instead, perform history substitution and reload the
# line into the editing buffer
setopt hist_verify
# don't share history between concurrent shell instances
setopt no_share_history


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
