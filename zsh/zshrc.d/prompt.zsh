ZSH_PROMPT_PATH=${HOME}'/.zsh/prompts'

# Default prompt is the powerline prompt
source ${ZSH_PROMPT_PATH}/powerline.zsh

setprompt() {
    local PROMPT_FULLPATH=${ZSH_PROMPT_PATH}/${1}".zsh"
    if [ -f "${PROMPT_FULLPATH}" ]; then
        source $PROMPT_FULLPATH
    else
        print "'$1' does not exist"
    fi
}
