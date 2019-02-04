ln -ls local-config/project-name.yml ~/.tmuxninator
"--------------------------------------------------------------------------------- 
#!/usr/bin/env bash

is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
tmux bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
tmux bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
tmux bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
tmux bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
tmux bind-key -n C-\\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
tmux bind-key -T copy-mode-vi C-h select-pane -L
tmux bind-key -T copy-mode-vi C-j select-pane -D
tmux bind-key -T copy-mode-vi C-k select-pane -U
tmux bind-key -T copy-mode-vi C-l select-pane -R
tmux bind-key -T copy-mode-vi C-\\ select-pane -l
"--------------------------------------------------------------------------------- 
# -------------
# Try to get close to normal colors in tmux
# -------------
set -g default-terminal "screen-256color"

# -------------
# start with window 1 (instead of 0)
# -------------
set -g base-index 1

# -------------
# start with pane 1
# -------------
set -g pane-base-index 1

# -------------
# status line
# -------------
set -g status-justify left
set -g status-bg black
set -g status-fg white
set -g status-interval 4

# -------------
# window status
# -------------
setw -g window-status-format "#[fg=black]#[bg=colour7] #I #[fg=black]#[bg=colour15] #W "
setw -g window-status-current-format "#[fg=colour8]#[bg=white] #I #[bg=colour69]#[fg=white] #W "
setw -g window-status-current-bg black
setw -g window-status-current-fg yellow
setw -g window-status-current-attr bold
setw -g window-status-bg black
setw -g window-status-fg blue
setw -g window-status-attr default

# -------------
# Info on left (no session display)
# -------------
set -g status-left ''
set -g status-right-length 150
set -g status-right '#[fg=colour69] #(hostname)@#(hostname -I | cut -d " " -f 1) | #[fg=colour160]♥ #[fg=colour69]#(acpi -b | cut -d" " -f4 | cut -d"%" -f1)% | %H:%M | %Y-%m-%d '
"--------------------------------------------------------------------------------- 

"--------------------------------------------------------------------------------- 
"--------------------------------------------------------------------------------- 
tbone.vim
Basic tmux support for Vim.

    :Tmux lets you call any old tmux command (with really good tab complete).
    :Tyank and :Tput give you direct access to tmux buffers.
    :Twrite sends a chunk of text to another pane. Give an argument like windowtitle.2, top-right, or last, or let it default to the previously given argument.
    :Tattach lets you use a specific tmux session from outside of it.

"--------------------------------------------------------------------------------- 
"--------------------------------------------------------------------------------- 

tmux.vim

Vim plugin for .tmux.conf.
Features

When you edit .tmux.conf you get:

    proper syntax highlighting
    commentstring - so that plugins like vim-commentary work as intended
    K - jumps to the *exact* place in man tmux where the word under cursor is explained (a helluva time saver). This should work correctly on practically anything in .tmux.conf.
    :make - invokes tmux source .tmux.conf and places all the errors (if any) in quicklist
    g! - executes lines as tmux commands. Works on visual selection or as a motion. g!! executes just the current line.

"--------------------------------------------------------------------------------- 


