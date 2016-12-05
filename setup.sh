#!/bin/bash

# install homebrew
echo "Install homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install app by homebrew
sh brew.sh


## dotfiles Download github
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/qt4cpp/dotfiles/tarball/master"
REMOTE_URL="git@github.com:qt4cpp/dotfiles.git"

# ディレクトリがなければダウンロード（と解凍）する
if [ ! -d ${DOT_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  mkdir ${DOT_DIRECTORY}

  if type "git" > /dev/null 2>&1; then
    git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
  else
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
    rm -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi


## Simlink
cd ${DOT_DIRECTORY}

sh link.sh

## set installed zsh & fish
if [ ${SHELL} != "bin/fish" ] then
  echo "Change your shell to fish-shell"
  echo "/usr/local/bin/zsh" >> /etc/shells
  echo "/usr/local/bin/fish" >> /etc/shells
  chsh -s /usr/local/bin/fish
fi
