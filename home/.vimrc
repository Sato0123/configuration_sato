"# Emacsキーバインド
"## insert mode key map
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-h> <BS>
inoremap <silent> <C-d> <Del>
inoremap <silent> <C-k> <ESC>:EmacsKill<CR>a
"## command line key map
cnoremap <silent> <C-p> <Up>
cnoremap <silent> <C-n> <Down>
cnoremap <silent> <C-f> <Right>
cnoremap <silent> <C-b> <Left>
cnoremap <silent> <C-a> <Home>
cnoremap <silent> <C-e> <End>
cnoremap <silent> <C-h> <BS>
cnoremap <silent> <C-d> <Del>
"## functions 
command! -nargs=0 EmacsKill call EmacsKill()
function! EmacsKill()
  let line_text = getline('.')
  let col_pos = col('.')
  let line_end = col('$')
  if col_pos >= line_end
    " カーソルが行末にいるなら、次の行と結合（ただし最終行でなければ）
    if line('.') < line('$')
      normal! J
    endif
  else
    if line_text == ''
      " 空行ならそのまま削除
      normal! dd
    else
      " カーソル位置から行末まで削除（削除内容はレジスタに入る）
      execute 'normal! "' . v:register . 'D'
    endif
  endif
endfunction

"# change buffers key bind
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
 "バッファをCtrl+j,kで移動する。

"# normalModeEnter-Carrigeline
nnoremap <CR> A<Return><Esc>^k
 "ノーマルモードのままEnterを押して改行を挿入する。

"# jkEsc
inoremap jk <ESC>
inoremap ｊｋ <ESC>

"# line numbers
set relativenumber
set number

"# Indent for Python
augroup fileTypeIndent
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END
