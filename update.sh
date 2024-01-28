#!/bin/bash
# Script for updating this repo with current versions of the local files

# nvim
rsync -av --delete $XDG_CONFIG_HOME/nvim/ ./.config/nvim/

# tmux
rsync -av --delete ~/.tmux.conf ./.tmux.conf

# zsh
rsync -av --delete ~/.zshrc ./.zshrc

# alacritty
rsync -av --delete $XDG_CONFIG_HOME/alacritty/ ./.config/alacritty/

# sketchybar
rsync -av --delete $XDG_CONFIG_HOME/sketchybar/ ./.config/sketchybar/

# skhd
rsync -av --delete $XDG_CONFIG_HOME/skhd/ ./.config/skhd/

# yabai
rsync -av --delete $XDG_CONFIG_HOME/yabai/ ./.config/yabai/
