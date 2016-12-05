#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"

cd ${DOT_DIRECTORY}

# symlink を dotfiles/ 以下すべてを ~/ にはる
for f in .??*
do
  # 無視したいファイルやディレクトリはこんな風に追加してね
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  [[ ${f} = ".config" ]] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

# .configはすでにあるかもしれないので別でやる
if [ ! ~/.config ]; then
  mkdir ${HOME}/.config
fi

cd ${DOT_DIRECTORY}/.config
for a in .??*
do
  ln -snfv ${DOT_DIRECTORY}/.config/fish/ ${HOME}/.config/fish
  ln -snfv ${DOT_DIRECTORY}/.config/fisherman/ ${HOME}/.config/fisherman
done

echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
