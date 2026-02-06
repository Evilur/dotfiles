run-bindkeys() {
    bindkey '^I' expand-or-complete
    bindkey -M menuselect 'h' backward-char
    bindkey -M menuselect 'j' down-line-or-history
    bindkey -M menuselect 'k' up-line-or-history
    bindkey -M menuselect 'l' forward-char
    bindkey -M menuselect 'q' send-break
    bindkey -M menuselect '^[' send-break

    bindkey -M viins '^J' self-insert-unmeta

    unset -f run-bindkeys
}
