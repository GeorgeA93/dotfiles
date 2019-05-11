# Use alt as mod key
set $mod Mod1

font pango:Hack 8

for_window [class="^.*"] border pixel 1
gaps inner 10
gaps outer 15

floating_modifier $mod

bindsym $mod+Return exec i3-sensible-terminal

bindsym $mod+q kill

# Program commands
bindsym $mod+space exec rofi -show run
bindsym $mod+Tab exec rofi -show window
bindsym $mod+p exec terminator -e "source ~/.zshrc && ranger"
bindsym $mod+g exec google-chrome

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
bindsym $mod+b split h

# Split in vertical direction
bindsym $mod+v split v

# Enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# Toggle tiling and floating
bindsym $mod+Shift+space floating toggle

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

bindsym $mod+r mode "resize"

mode "resize" {
  bindsym l resize grow width 10 px or 10 ppt
  bindsym h resize shrink width 10 px or 10 ppt
  bindsym j resize shrink height 10 px or 10 ppt
  bindsym k resize grow height 10 px or 10 ppt

  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym $mod+r mode "default"
}

# Press $mod+Shift+g to enter the gap mode.
# Choose o or i for modifying outer/inner gaps.
# Press one of + / - (in-/decrement for current workspace)
# or 0 (remove gaps for current workspace). If you also press Shift
# with these keys, the change will be global for all workspaces.
set $mode_gaps Gaps: (o) outer, (i) inner
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"

mode "$mode_gaps" {
        bindsym o      mode "$mode_gaps_outer"
        bindsym i      mode "$mode_gaps_inner"
        bindsym Return mode "default"
        bindsym Escape mode "default"
}
mode "$mode_gaps_inner" {
        bindsym plus  gaps inner current plus 5
        bindsym minus gaps inner current minus 5
        bindsym 0     gaps inner current set 0

        bindsym Shift+plus  gaps inner all plus 5
        bindsym Shift+minus gaps inner all minus 5
        bindsym Shift+0     gaps inner all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}
mode "$mode_gaps_outer" {
        bindsym plus  gaps outer current plus 5
        bindsym minus gaps outer current minus 5
        bindsym 0     gaps outer current set 0

        bindsym Shift+plus  gaps outer all plus 5
        bindsym Shift+minus gaps outer all minus 5
        bindsym Shift+0     gaps outer all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+Shift+e mode "Exit (L)ogout, (R)eboot, (P)oweroff"

# Create Log out, Reboot, Poweroff bindings
mode "Exit (L)ogout, (R)eboot, (P)oweroff" {
        bindsym $mod+r exec systemctl reboot
        bindsym $mod+l exit
        bindsym $mod+p exec systemctl poweroff

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

# Custom window config
assign [class="spacerush"] $ws1
for_window [class="spacerush"] focus

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume bluez_sink.40_EF_4C_87_C9_5E.a2dp_sink +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume bluez_sink.40_EF_4C_87_C9_5E.a2dp_sink -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute bluez_sink.40_EF_4C_87_C9_5E.a2dp_sink toggle # mute sound

# Media player controls
bindsym XF86AudioPause exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# Colours
set_from_resource $base00 color0 #000000
set_from_resource $base08 color1 #000000
set_from_resource $base0B color2 #000000
set_from_resource $base0A color3 #000000
set_from_resource $base0D color4 #000000
set_from_resource $base0E color5 #000000
set_from_resource $base0C color6 #000000
set_from_resource $base05 color7 #000000
set_from_resource $base03 color8 #000000
set_from_resource $base09 color9 #000000
set_from_resource $base01 color10 #000000
set_from_resource $base02 color11 #000000
set_from_resource $base04 color12 #000000
set_from_resource $base06 color13 #000000
set_from_resource $base0F color14 #000000
set_from_resource $base07 color15 #000000

# Property Name         Border  BG      Text    Indicator Child Border
client.focused          $base05 $base0D $base00 $base0D $base0D
client.focused_inactive $base01 $base01 $base05 $base03 $base01
client.unfocused        $base01 $base00 $base05 $base01 $base01
client.urgent           $base08 $base08 $base00 $base08 $base08
client.placeholder      $base00 $base00 $base05 $base00 $base00
client.background       $base07

# Startup Commands
exec_always --no-startup-id $HOME/dotfiles/bin/launch-polybar
exec_always --no-startup-id feh --bg-scale $HOME/dotfiles/wallpapers/capetown.jpg
exec_always --no-startup-id xrdb -load ~/.Xresources
exec_always --no-startup-id pulseaudio --start
