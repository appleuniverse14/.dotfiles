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

inoremap <silent> jj <ESC>

set relativenumber
set number
set scrolloff=999
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set hlsearch
set cindent

"カーソル表示を変更"
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"括弧とクォーテーションの自動補完"
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"カーソル位置の記憶"
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END
