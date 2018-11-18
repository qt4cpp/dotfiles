#!/bin/bash

if type "brew" > /dev/null 2>&1; then
  echo "Updating Homebrew..."
  brew update && brew upgrade
  [[ $? ]] && echo "$(tput setaf 2)Update Homebrew complete. ✔︎$(tput sgr0)"

  brew tap 'caskroom/cask'
  brew tap 'homebrew/dupes'
  brew tap 'sanemat/font'

  local list_formulae
  local -a missing_formulae
  local -a desired_formulae=(
    'brew-cask'
    'coreutils'
    'ffmpeg --with-fdk-aac --with-libass --with-libsoxr --with-libvidstab --with-opencore-amr --with-openh264 --with-openjpeg --with-openssl --with-rtmpdump --with-sdl2 --with-tools --with-x265 --with-srt --with-fontconfig --with-freetype --with-frei0r --with-libbluray --with-libcaca --with-libvorbis --with-libvpx --with-opus --with-speex --with-theora --with-wavpack --with-webp'
    'git'
    'go'
    'imagemagick --with-webp'
    'lua'
    'mpv --with-bundle --HEAD'
    'the_platinum_searcher'
    'zsh'
    'fish'
    'vim --with-lua'
    'z'
  )

  local installed=`brew list`

  # desired_formulaeで指定していて、インストール
  for index in ${!desired_formulae[*]}
  do
    local formula=`echo ${desired_formulae[$index]} | cut -d' ' -f 1`
    if [[ -z `echo "${installed}" | grep "^${formula}$"` ]]; then
      missing_formulae=("${missing_formulae[@]}" "${desired_formulae[$index]}")
    else
      echo "Installed ${formula}"
      [[ "${formula}" = "ricty" ]] && local installed_ricty=true
    fi
  done

  if [[ "$missing_formulae" ]]; then
    list_formulae=$( printf "%s " "${missing_formulae[@]}" )

    echo "Installing missing Homebrew formulae..."
    brew install $list_formulae

    [[ $? ]] && echo "$(tput setaf 2)Installed missing formulae ✔︎$(tput sgr0)"
  fi

  # Emacs suzuki-san ver
  brew tap suzuki/emacs
  brew install suzuki/emacs/emacs --with-cocoa --HEAD --imagemagick --libsvg --gnutls
  brew linkapps emacs
  
  brew linkapps mpv
  
  brew cleanup
  
else
  echo "You have to install homebrew at first."
fi