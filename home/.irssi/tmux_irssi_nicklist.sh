#!/usr/bin/env bash
# This should work whether you are already in a TMUX session or not...
# Irssi directory is assumed to be in the user's home dir
if [ -z "$TMUX" ]; then
    tmux new-session -d -s ircuser 
    tmux split-window -tircuser -h -l20
    tmux send-keys -tircuser "tmux send-keys -t0 \"irssi\" C-m; \ 
        tmux send-keys -t0 \"/set nicklist_height \$(stty size | cut -f1 -d' ' -)\" C-m; \
        tmux send-keys -t0 \"/set nicklist_width \$(stty size | cut -f2 -d' ' -)\" C-m; \ 
        tmux send-keys -t1 \"cat ~/.irssi/nicklistfifo\" C-m; \
        tmux send-keys -t0 \"/nicklist fifo\" C-m; \
        tmux select-pane -t0" C-m
    tmux attach-session -t ircuser
else
    tmux split-window -h -l20
    tmux send-keys -t1 "tmux send-keys -t0 \"irssi\" C-m; \
        tmux send-keys -t0 \"/set nicklist_height \$(stty size | cut -f1 -d' ' -)\" C-m; \
        tmux send-keys -t0 \"/set nicklist_width \$(stty size | cut -f2 -d' ' -)\" C-m; \
        tmux send-keys -t0 \"/nicklist fifo\" C-m; \
        cat ~/.irssi/nicklistfifo" C-m
fi
