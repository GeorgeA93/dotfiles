# Use alt as mod key
set $mod Mod1

font pango:monospace 8

floating_modifier $mod

bindsym $mod+Return exec i3-sensible-terminal

bindsym $mod+q kill

bindsym $mod+d exec dmenu_run

exec_always --no-startup-id xmodmap -e "clear lock"
exec_always --no-startup-id xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
exec_always --no-startup-id xmodmap -e "keycode 66 = Escape NoSymbol Escape"

# Change focus
bindsym $mod+h focus left
bindsym $mod+l focus right
bindsym $mod+j focus down
bindsym $mod+k focus up

# Reload current config file
bindsym $mod+Shift+c reload
# Restart i3 inplace
bindsym $mod+Shift+r restart

# Move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+l move right
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up

