#!/bin/bash

# install homebrew
echo "Install homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## dotfiles Download github
DOT_DIRECTORY="${HOME}/dotfiles"

# Spacemacsをインストール
#EMACS_DIR="${HOME}/.emacs.d"
#SPACEMACS_URL="https://github.com/syl20bnr/spacemacs"
#mkdir -p ${EMACS_DIR}
#git clone ${SPACEMACS_URL} $EMACS_DIR

## Simlink
cd ${DOT_DIRECTORY}

sh link.sh

## set installed zsh & fish
#if [ ${SHELL} != "bin/fish" ] then
#  echo "Change your shell to fish-shell"
#  echo "/usr/local/bin/zsh" >> /etc/shells
#  echo "/usr/local/bin/fish" >> /etc/shells
#  chsh -s /usr/local/bin/fish
##fi
