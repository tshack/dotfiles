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

ZSH_PROMPT_MODE_INSERT="%{$fg_bold[green]%}➜ "
ZSH_PROMPT_MODE_NORMAL="%{$fg_bold[red]%}➜ "

if [ $__ZSH_MODULE_MODAL_PROMPT ]
then
    PROMPT='${ZSH_PROMPT_MODE}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(_zsh_git_branch)%{$fg_bold[blue]%} % %{$reset_color%}'
else
    PROMPT='%{$fg_bold[cyan]%}%c %{$fg_bold[blue]%}$(_zsh_git_branch)%{$fg_bold[blue]%} % %{$reset_color%}'
fi

ZSH_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
