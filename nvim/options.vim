""-------------------------------------------------
"" 見た目
""-------------------------------------------------
set termguicolors " True Color対応
set title " ターミナルのタブ名に現在編集中のファイル名を設定
set relativenumber
set scrolloff=999
set wrap " 行を折り返す
set showmatch " 括弧入力時の対応する括弧を表示
set list "不可視文字の可視化
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲ " デフォルト不可視文字は美しくないのでUnicodeできれいに
set matchtime=3 " 対応括弧のハイライト表示を3sにする
set smartindent " オートインデント
set expandtab " softtabstop や shiftwidth で設定されている値分のスペースが挿入されたときに、挿入されたスペース数が tabstop に達してもタブに変換されない
set tabstop=4 " スペースn個分で1つのタブとしてカウントするか
set softtabstop=4 " <tab>を押したとき、n個のスペースを挿入
set shiftwidth=4 " <Enter>や<<, >>などを押したとき、n個のスペースを挿入
""いい感じにカーソルがハイライトされる""
augroup vimrc-auto-cursorline
    autocmd!
    autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
    autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END
""カーソル表示を変更""
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

""-------------------------------------------------
"" 検索
""-------------------------------------------------
set ignorecase " 大文字小文字の区別なく検索する
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan " 検索時に最後まで行ったら最初に戻る
set hlsearch " 検索語をハイライト表示
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set inccommand=split " インタラクティブに変更

""-------------------------------------------------
"" その他
""-------------------------------------------------
set splitright "画面を縦分割する際に右に開く
set mouse=a "マウスを使用
""clang-format""
function! s:clang_format()
    let now_line = line(".")
    exec ":%! clang-format-6.0-robotech"
    exec "." . now_line
endfunction
if executable("clang-format-6.0-robotech")
    augroup cpp_clang_format
        autocmd!
        autocmd Bufwrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
    augroup END
endif
""カーソル位置の記憶""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END
""yankした文字列をクリップボードにコピー""
set clipboard&
set clipboard^=unnamedplus
set encoding=utf-8 " 文字コード
