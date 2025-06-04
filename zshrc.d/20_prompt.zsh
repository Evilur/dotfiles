##
# Configuring zsh prompts
# @author Evilur <mail@evilur.ru>
# @since 2025-05-29
##

##
# @param PS_REG Color of brackets, dashes and other formatting chars
# @param PS_ROOT Color of username, hostname and prompt EOL char
##
PS_REG=blue
PS_ROOT=red

##
# Special symbols for improve the appearance of the shell
# You can add {@code %F{color}} to change the color of the character
#
# @param PS_SPLIT Splitter between a username and a hostname
# @param PS_ERROR Symbol after the error code
# @param PS_BG Symbol after the number of background processes
##
PS_SPLIT=@
PS_ERROR=🔥
PS_BG=🌀

# If we have NOT a desktop env
if [[ -z "$WAYLAND_DISPLAY" && -z "$DISPLAY" ]]; then
    PS_ERROR='%F{red}X'
    PS_BG='%F{green}&'
fi

precmd() {
    ###############################
    # Get the SPWD subtract value #
    ###############################

    # Get the last error code
    local last_error_code=$?
    readonly last_error_code

    # Get the number of jobs in the background
    local jobs_background=$(jobs -p | wc -l)
    readonly jobs_background

    # Get the simplified version of the first line of the PS1
    local prompt='___(%n'$PS_SPLIT'%M)-[]'

    # If we have the error code
    if [[ $last_error_code != 0 ]]; then
        # Add this to the prompt
        prompt="$prompt-[$last_error_code$PS_ERROR]"
    fi

    # Do the same with background jobs
    if [[ $jobs_background != 0 ]]; then
        prompt="$prompt-[$jobs_background$PS_BG]"
    fi

    # Interpretate the prompt
    prompt=$(builtin print -P "$prompt")

    # Get the lenght of the prompt without the working directory
    SPWD_SUBTRACT=$(
        python3 -c "from wcwidth import wcswidth; print(wcswidth('$prompt'))"
    )

    ##################################################################
    # Print a new line before the prompt every time except the first #
    ##################################################################
    if [[ "$NEWLINE_BEFORE_PS1" == true ]]; then echo
    else NEWLINE_BEFORE_PS1=true; fi

    ###########################
    # Make the cursor visible #
    ###########################
    echo -en '\e[?25h'
}

# Set the PS1 prompt
readonly PS1=\
'%B%F{'$PS_REG'}┌──(%F{%(!.'$PS_ROOT'.'$PS_REG')}%n'$PS_SPLIT'%M%F{'$PS_REG'})\
-[%f$(spwd -s $SPWD_SUBTRACT)%F{'$PS_REG'}]\
%(?..-[%f%?'$PS_ERROR'%F{'$PS_REG'}])\
%(1j.-[%f%j'$PS_BG'%F{'$PS_REG'}].)
└─%F{%(!.'$PS_ROOT'.'$PS_REG')}%(!.#.$)%f%b '

# Set the PS2 prompt
readonly PS2='%B%F{%(!.'$PS_ROOT'.'$PS_REG'}>>>%f%b '

# Set the right prompt
readonly RPROMPT=

unset PS_SPLIT
unset PS_ERROR
unset PS_BG
unset PS_REG
unset PS_ROOT
