function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd)
            ZSH_PROMPT_MODE=$ZSH_PROMPT_MODE_NORMAL
            ;;
        *)
            ZSH_PROMPT_MODE=$ZSH_PROMPT_MODE_INSERT
            ;;
    esac
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

__ZSH_MODULE_MODAL_PROMPT=1
