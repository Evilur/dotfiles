readonly PS_REG=blue
readonly PS_ROOT=red

# @PS_SPLIT A splitter between a username and a hostname
# @PS_ERROR A symbol after the error code
# @PS_BG A symbol after the number of background processes
PS_SPLIT=@
PS_ERROR=🔥
PS_BG=🌀

# If we have NOT a desktop env
if [[ -z "$WAYLAND_DISPLAY" && -z "$DISPLAY" ]]; then
    PS_ERROR='%F{red}X'
    PS_BG='%F{green}&'
fi

precmd() {
    # GET THE SPWD SUBTRACT VALUE:

    # Get the last error code
    local last_error_code=$?

    # Get the number of jobs in the background
    local jobs_background=$(jobs -p | wc -l)

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
    prompt=$(print -P "$prompt")

    # Get the lenght of the prompt without the working directory
    SPWD_SUBTRACT=$(
        python3 -c "from wcwidth import wcswidth; print(wcswidth('$prompt'))"
    )

# ---------------------------------------------------------------------------- #

    # Print a new line before the prompt every time except the first appearance
    if [[ "$NEWLINE_BEFORE_PS1" == true ]]; then echo
    else NEWLINE_BEFORE_PS1=true; fi

# ---------------------------------------------------------------------------- #

    # Make the cursor visible
    echo -en '\e[?25h'
}

# Set the PS1 prompt
PS1=\
'%B%F{'$PS_REG'}┌──(%F{%(!.'$PS_ROOT'.'$PS_REG')}%n'$PS_SPLIT'%M%F{'$PS_REG'})\
-[%f$(spwd -s $SPWD_SUBTRACT)%F{'$PS_REG'}]\
%(?..-[%f%?'$PS_ERROR'%F{'$PS_REG'}])\
%(1j.-[%f%j'$PS_BG'%F{'$PS_REG'}].)
└─%F{%(!.'$PS_ROOT'.'$PS_REG')}%(!.#.$)%f%b '

# Set the PS2 prompt
PS2='%B%F{%(!.'$PS_ROOT'.'$PS_REG'}>>>%f%b '

# Set the right prompt
RPROMPT=
