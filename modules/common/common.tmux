set -g default-shell /bin/zsh

set -g prefix C-a
unbind-key C-b
bind-key C-a send-prefix

# fix colours
set -g default-terminal "screen-256color"

# mouse support
set -g mouse on

# move around panes nicely
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
  | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

is_fzf="ps -o state= -o comm= -t '#{pane_tty}' \
  | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?fzf$'"

bind -n C-h run "($is_vim && tmux send-keys C-h) || \
                 tmux select-pane -L"

bind -n C-j run "($is_vim && tmux send-keys C-j)  || \
                 ($is_fzf && tmux send-keys C-j) || \
                 tmux select-pane -D"

bind -n C-k run "($is_vim && tmux send-keys C-k) || \
                 ($is_fzf && tmux send-keys C-k)  || \
                 tmux select-pane -U"

bind -n C-l run "($is_vim && tmux send-keys C-l) || \
                 tmux select-pane -R"

bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

# start window numbers from 1
set -g base-index 1

# set escape time so vim is responsive inside tmux
set -g escape-time 1

# prefix r: reload tmux config
bind r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"

# pane splitting
bind v split-window -h -c "#{pane_current_path}"
bind s split-window -v -c "#{pane_current_path}"

# visual notification of activity in other windows
setw -g monitor-activity off
set -g visual-activity off

# make iterm window/tab name reflect tmux session
set-option -g set-titles on
set-option -g set-titles-string "#T - #W"

# Resize pane shortcuts
bind -r H resize-pane -L 10
bind -r J resize-pane -D 10
bind -r K resize-pane -U 10
bind -r L resize-pane -R 10

bind -T root F12  \
  set prefix None \;\
  set key-table off \;\
  set status-style "fg=$color_status_text,bg=$color_window_off_status_bg" \;\
  set window-status-current-format "#[fg=$color_window_off_status_bg,bg=$color_window_off_status_current_bg]$separator_powerline_right#[default] #I:#W# #[fg=$color_window_off_status_current_bg,bg=$color_window_off_status_bg]$separator_powerline_right#[default]" \;\
  set window-status-current-style "fg=$color_dark,bold,bg=$color_window_off_status_current_bg" \;\
  if -F '#{pane_in_mode}' 'send-keys -X cancel' \;\
  refresh-client -S \;\

bind -T off F12 \
  set -u prefix \;\
  set -u key-table \;\
  set -u status-style \;\
  set -u window-status-current-style \;\
  set -u window-status-current-format \;\
  refresh-client -S

set -s escape-time 0

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-resurrect'

# Plugin conifg
set -g @yank_selection_mouse 'clipboard'

# Start up tmux plugin manager
run -b '~/.tmux/plugins/tpm/tpm'
