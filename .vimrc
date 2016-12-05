if has("mac")
" mac用の設定
set guifont=MiguMix\ 1M\ Regular:h12
elseif has("unix")
" unix固有の設定
elseif has("win64")
" 64bit_windows固有の設定
elseif has("win32unix")
" Cygwin固有の設定
elseif has("win32")
" 32bit_windows固有の設定
endif

set linespace=3
" ---------------------------
" memolistの設定
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

" Vi互換モードをオフ
set nocompatible
" ファイルタイプを判別してプラグインを有効にする
filetype indent plugin on

colorscheme desert
" バッファを保存していなくてもほかのバッファを表示する
set hidden
" command保管
set wildmenu
" コマンド表示
set showcmd
" hilight search
set hlsearch
" Use case insensitive search, except using capital letters
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースで削除する
set backspace=indent,eol,start

set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

set ruler

set laststatus=2

set confirm

set visualbell
set t_vb=

" ---------------------------
"  indentation options
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/Align'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'troydm/easybuffer.vim'
NeoBundle 'vim-scripts/vim-auto-save'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

" 色づけをする
syntax on

" ---------------------------
"   encoding options
"
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    if has('mac')
      let &fileencodings = s:enc_jis .','. s:enc_euc
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    else
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    endif
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif

