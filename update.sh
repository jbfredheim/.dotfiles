#!/bin/bash
# Script for updating this repo with current versions of the local files

for arg in "$@"; do
  case $arg in
    nvim)
      echo "Updating nvim..."
      rsync -av --delete $XDG_CONFIG_HOME/nvim/ ./.config/nvim/
      echo "Done."
      ;;
    tmux)
      echo "Updating tmux..."
      rsync -av --delete ~/.tmux.conf ./.tmux.conf
      echo "Done."
      ;;
    zsh)
      echo "Updating zsh..."
      rsync -av --delete ~/.zshrc ./.zshrc
      echo "Done."
      ;;
    alacritty)
      echo "Updating alacritty..."
      rsync -av --delete $XDG_CONFIG_HOME/alacritty/ ./.config/alacritty/
      echo "Done."
      ;;
    sketchybar)
      echo "Updating sketchybar..."
      rsync -av --delete $XDG_CONFIG_HOME/sketchybar/ ./.config/sketchybar/
      echo "Done."
      ;;
    skhd)
      echo "Updating skhd..."
      rsync -av --delete $XDG_CONFIG_HOME/skhd/ ./.config/skhd/
      echo "Done."
      ;;
    yabai)
      echo "Updating yabai..."
      rsync -av --delete $XDG_CONFIG_HOME/yabai/ ./.config/yabai/
      echo "Done."
      ;;
  esac
done

