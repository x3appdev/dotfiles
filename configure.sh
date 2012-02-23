#!/bin/sh

# link my configuration files
find ~/.dotfiles/ -maxdepth 1 -name ".*"        \
  ! -path ~/.dotfiles/ ! -path ~/.dotfiles/.git \
  -exec echo ln -sf {} --target-directory=$HOME \;

# Install terminator config
mkdir -p $HOME/.config/terminator
cp ~/.dotfiles/etc/terminator/config $HOME/.config/terminator
