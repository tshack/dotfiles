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
        if [ $(_zsh_git_dirty) == "0" ]
        then
            if [ $__ZSH_MODULE_MODAL_PROMPT ]
            then
                echo "%{%K{yellow}%} %{%F{black}%} ${branch} %{%b%F{yellow}%}"
            else
                echo "(%{$fg[red]%}${branch}%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
            fi
        else
            if [ $__ZSH_MODULE_MODAL_PROMPT ]
            then
                echo "%{%K{green}%} %{%F{black}%} ${branch} %{%b%F{green}%}"
            else
                echo "(%{$fg[red]%}${branch}%{$fg[blue]%})"
            fi
        fi
    fi
}

if [ $__ZSH_MODULE_MODAL_PROMPT ]
then
    ZSH_PROMPT_DIR_INSERT="%{%K{black}%}%{%B%F{yellow}%} %c %{%b%F{black}%}"
    ZSH_PROMPT_DIR_NORMAL="%{%K{red}%}%{%B%F{yellow}%} %c %{%b%F{red}%}"

    ZSH_PROMPT_GIT_BRANCH=$(_zsh_git_branch)

    ZSH_PROMPT_MODE_INSERT=$ZSH_PROMPT_DIR_INSERT
    ZSH_PROMPT_MODE_NORMAL=$ZSH_PROMPT_DIR_NORMAL

    PROMPT='${ZSH_PROMPT_MODE}$(_zsh_prompt_git)%{%f%b%k%} '
#    ORMAL  +0 ~3 -0  master  ~/.dotfiles/zsh/z
else
    PROMPT='%{$fg_bold[cyan]%}%c %{$fg_bold[blue]%}$(_zsh_prompt_git)%{$fg_bold[blue]%} % %{$reset_color%}'
fi
