# use vim mode
bindkey -v

# start typing + Ctrl+k - fuzzy find history backward
bindkey "^K" up-line-or-search
# start typing + Ctrl+j - fuzzy find history forward
bindkey "^J" down-line-or-search
# despite vim mode, its hard to beat 2 decades of stock bash usage
## [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word     
## [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word
