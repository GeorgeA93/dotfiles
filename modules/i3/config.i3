# Use alt as mod key
set $mod Mod1

font pango:Hack 8

for_window [class="^.*"] border pixel 1
gaps inner 10
gaps outer 15

floating_modifier $mod

bindsym $mod+Return exec i3-sensible-terminal

bindsym $mod+q kill

bindsym $mod+space exec rofi -theme base16-eighties -show run

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

# Split in horizontal direction
bindsym $mod+hh split h

# Split in vertical direction
bindsym $mod+v split v

# Enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+10 workspace $ws10

bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+10 move container to workspace $ws10

bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end you X session.' -B 'Yes, exit i3' 'i3-msg exit'"

mode "resize" {
  bindsym h resize grow width 10 px or 10 ppt
  bindsym l resize shrink width 10 px or 10 ppt
  bindsym k resize shrink height 10 px or 10 ppt
  bindsym j resize grow height 10 px or 10 ppt

  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

bar {
  position top
  status_command i3status
}

exec_always feh --bg-scale ~/dotfiles/wallpapers/mountains.jpg

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume bluez_sink.40_EF_4C_87_C9_5E.a2dp_sink +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume bluez_sink.40_EF_4C_87_C9_5E.a2dp_sink -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute bluez_sink.40_EF_4C_87_C9_5E.a2dp_sink toggle # mute sound

# Media player controls
bindsym XF86AudioPause exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
