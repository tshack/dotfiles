# prompt.zsh
#
#   This is where _everything_ related to the
#   appearance of the prompt lives.
#
##################################################

# enable colors in prompt
autoload -U colors && colors
# remove right prompt when input typed into prompt
setopt transient_rprompt

function _zsh_prompt_git {
    local bg_color=$1
    local clean_color=$2
    local dirty_color=$3

    local branch=$(_zsh_git_branch)
    if [ ! -z $branch ]
    then

        # make prompt collapse
        if [ $COLUMNS -lt 50 ]
        then
            branch="\b"
        fi

        # add on the prompt if the git repo is dirty
        # what is add is different depending on if we are
        # using the modal_prompt module
        if [ $(_zsh_git_dirty) == "0" ]
        then
            echo "%{%K{$bg_color}%} %{%F{$dirty_color}%} ${branch} %{%b%F{$bg_color}%}"
        else
            echo "%{%K{$bg_color}%} %{%F{$clean_color}%} ${branch} %{%b%F{$bg_color}%}"
        fi
    fi
}

ZSH_PROMPT_GIT_BRANCH=$(_zsh_git_branch)

ZSH_PROMPT_MODE_INSERT="%{%K{214}%}%{%B%F{16}%} %c %{%b%F{214}%}"
ZSH_PROMPT_MODE_NORMAL="%{%K{255}%}%{%B%F{16}%} %c %{%b%F{255}%}"
ZSH_PROMPT_GRAYSCALE="%{%K{244}%}%{%B%F{16}%} %c %{%b%F{244}%}"

# this will be changed by zle via the modal_prompt module
ZSH_PROMPT_MODE=$ZSH_PROMPT_MODE_INSERT

ZSH_PROMPT='${ZSH_PROMPT_MODE}$(_zsh_prompt_git 236 231 214)%{%f%b%k%} '
ZSH_PROMPT_FROZEN='${ZSH_PROMPT_GRAYSCALE}$(_zsh_prompt_git 236 251 244)%{%f%b%k%} '
