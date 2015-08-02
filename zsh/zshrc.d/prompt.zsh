# prompt.zsh
#
#   This is where _everything_ related to the
#   prompt lives.
#
##################################################

# enable colors in prompt
autoload -U colors && colors

function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd)
            mode="%{$fg_bold[red]%}➜ "
            ;;
        *)
            mode="%{$fg_bold[green]%}➜ "
            ;;
    esac
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='${mode}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
