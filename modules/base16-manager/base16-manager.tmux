# COLOUR (base16)

# This theme is a 256 color variant and it uses the color codes of the base16
# (256 color) terminal/shell themes:
# https://github.com/chriskempson/base16
# https://github.com/chriskempson/base16-shell

# This theme may be used in combination with any base16 256 color
# terminal/shell theme.

# Base16 Styling Guidelines:
# base00 - Default Background
# base01 - Lighter Background (Used for status bars)
# base02 - Selection Background
# base03 - Comments, Invisibles, Line Highlighting
# base04 - Dark Foreground (Used for status bars)
# base05 - Default Foreground, Caret, Delimiters, Operators
# base06 - Light Foreground (Not often used)
# base07 - Light Background (Not often used)
# base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
# base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
# base0A - Classes, Markup Bold, Search Text Background
# base0B - Strings, Inherited Class, Markup Code, Diff Inserted
# base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
# base0D - Functions, Methods, Attribute IDs, Headings
# base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed

# Use colortest script from base16-shell to get color assignments

# default statusbar colors
set-option -g status-style bg=colour18,fg=colour03
set-option -g status-left-style fg=colour04

# default window title colors
set-window-option -g window-status-style bg=default,fg=colour03

# active window title colors
set-window-option -g window-status-current-style bg=default,fg=colour02

# pane border
set-option -g pane-border-style fg=colour18
set-option -g pane-active-border-style fg=colour19

# message text
set-option -g message-style bg=colour18,fg=colour07

# pane number display
set-option -g display-panes-active-colour colour02 # base0B
set-option -g display-panes-colour colour03 # base0A

# clock
set-window-option -g clock-mode-colour colour02 #base0B

# bell
set-window-option -g window-status-bell-style fg=colour18,bg=colour01
# base01, base 08
