run-bindkeys() {
    bindkey -M menuselect 'h' backward-char
    bindkey -M menuselect 'j' down-line-or-history
    bindkey -M menuselect 'k' up-line-or-history
    bindkey -M menuselect 'l' forward-char
    bindkey -M menuselect ' ' accept-and-infer-next-history
    bindkey -M menuselect 'q' send-break
    bindkey -M menuselect '^[' send-break

    bindkey -M viins '^J' self-insert-unmeta
    bindkey -M viins '^[[1~' beginning-of-line
    bindkey -M viins '^[[4~' end-of-line

    unset -f run-bindkeys
}
