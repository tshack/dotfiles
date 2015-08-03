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
            echo "%{%K{236}%} %{%F{214}%} ${branch} %{%b%F{236}%}"
        else
            echo "%{%K{238}%} %{%F{231}%} ${branch} %{%b%F{238}%}"
        fi
    fi
}

ZSH_PROMPT_GIT_BRANCH=$(_zsh_git_branch)

ZSH_PROMPT_MODE_INSERT="%{%K{214}%}%{%B%F{16}%} %c %{%b%F{214}%}"
ZSH_PROMPT_MODE_NORMAL="%{%K{255}%}%{%B%F{16}%} %c %{%b%F{255}%}"
# this will be changed by zle via the modal_prompt module
ZSH_PROMPT_MODE=$ZSH_PROMPT_MODE_INSERT

PROMPT='${ZSH_PROMPT_MODE}$(_zsh_prompt_git)%{%f%b%k%} '
