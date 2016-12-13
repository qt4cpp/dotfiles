# dotfiles 自動化
見よう見まねでdotfilesを自動化した。
## 構成
- setup.sh: 新規ならここからスタートする。
- brew.sh: homebrewを使って、ファイルをインストールする
- link.sh: ~/dotfiles/以下のsymlinkを~/に張る。

新規インストールじゃなくても使えるように3つのファイルに分けた。
macのシェルスクリプトの改行コードはLFでなくてはならない。

### 注意点
- fish-shellだけ.configが他ですでに使っていたので、別でリンクを作る。
- Emacsはmac ports版が良いらしいので、それを使っている。でもIMEパッチの設定がうまく動かないので、戻すか。前はEmacs-Plus?

## 更新
```
git add .
git commit -m "commit message"
git push origin master
```

## 取り出し
```
git clone
sh setup.sh
```