# If we not in the tmux session, run a new one
if [[ -z "$TMUX" ]]; then
    {
        # Get the list of sessions
        readonly sessions=$(
            tmux list-sessions -F '#{session_name}:#{session_attached}'
        )

        # Get the first detached session
        readonly detached=$(awk -F: '$2==0 {print $1; exit}' <<< "$sessions")

        # If we have the detached session
        if [[ -n "$detached" ]]; then
            exec tmux attach -t $detached
        fi

        # If we have NOT the detached session
        # And if we have NOT another session
        if [[ -z "$sessions" ]]; then
            exec tmux
        fi

        # If we have NOT another session
        # Get numbers until there are sessions with such names
        i=0
        while true; do
            # If we have NOT such a session
            if ! [[ $sessions =~ $i':.+' ]]; then
                # Create a new tmux session
                exec tmux new-session -s $i
            fi

            # Increment the number
            ((i++))
        done
    } 2>/dev/null # Dont print errors
fi
