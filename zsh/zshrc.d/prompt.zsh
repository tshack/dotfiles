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

function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd)
            ZSH_PROMPT_MODE="%{$fg_bold[red]%}➜ "
            ;;
        *)
            ZSH_PROMPT_MODE="%{$fg_bold[green]%}➜ "
            ;;
    esac
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='${ZSH_PROMPT_MODE}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(_zsh_git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
