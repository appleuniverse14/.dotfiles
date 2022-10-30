""プラグインの設定""
call plug#begin('~/.vim/plugged')
    Plug 'https://github.com/cohama/lexima.vim'
    Plug 'https://github.com/Shougo/deoplete.nvim'
    Plug 'https://github.com/roxma/nvim-yarp'
    Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
    Plug 'https://github.com/markonm/traces.vim'
    Plug 'https://github.com/airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'thinca/vim-quickrun'
    Plug 'Yggdroot/indentLine'
    Plug 'lervag/vimtex'
call plug#end()
"-------------------------------------------------
" インデントを可視化するプラグイン indentLine
"-------------------------------------------------
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦' "use ¦, ┆ or │
"-------------------------------------------------
" quickrun
"-------------------------------------------------
let g:quickrun_config = {
\   'tex': {
\       'command': 'latexmk',
\       'exec': ['%c -gg -pdfdvi %s', 'xdg-open %s:r.pdf']
\   },
\}
"-------------------------------------------------
" deoplete
"-------------------------------------------------
let g:deoplete#enable_at_startup = 1

""その他""
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

packadd! dracula
syntax enable

colorscheme dracula


"-------------------------------------------------
" 見た目
"-------------------------------------------------
set termguicolors " True Color対応
set title " ターミナルのタブ名に現在編集中のファイル名を設定
set relativenumber
set number
set scrolloff=999
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set hlsearch
set cindent

packadd termdebug 
""マウスを使用"
set mouse=a
let g:termdebug_wide = 163
inoremap <silent> jj <ESC>
inoremap <C-a> <home>
inoremap <C-e> <End>

"クリップボードを使用"
set clipboard=unnamedplus

"カーソル表示を変更"
if has('vim_starting')
    " 挿入モード時に点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[5 q"
    " ノーマルモード時に点滅のブロックタイプのカーソル
    let &t_EI .= "\e[1 q"
    " 置換モード時に点滅の下線タイプのカーソル
    let &t_SR .= "\e[3 q"
endif

"カーソル位置の記憶"
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

"clang-format"
function! s:clang_format()
  let now_line = line(".")
  exec ":%! clang-format"
  exec ":" . now_line
endfunction

if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
  augroup END
endif
