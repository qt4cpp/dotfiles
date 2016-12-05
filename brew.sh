if has "brew"; then
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
    'ffmpeg --with-faac --with-fdk-aac --with-ffplay --with-fontconfig --with-freetype --with-frei0r --with-libass --with-libbluray --with-libcaca --with-libquvi --with-libsoxr --with-libvidstab --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-openssl --with-opus --with-rtmpdump --with-speex --with-theora --with-tools --with-x265'
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

  # EmacsはMac port ver. メンテナンスされなければ変更する;161205
  brew tap 'railwaycat/emacsmacport'
  brew install emacs-mac
  brew linkapps emacs-mac
  
  brew linkapps mpv
  
  brew creanup
  
else
  echo "You have to install homebrew at first."
fi