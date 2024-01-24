#!/bin/bash
# Script for updating this repo with current versions of the local files

# nvim
rsync -av --delete ~/.config/nvim/ ./.config/nvim/

# tmux
rsync -av --delete ~/.tmux.conf ./.tmux.conf

# zsh
rsync -av --delete ~/.zshrc ./.zshrc
