" base config
set termguicolors
set noshowmode
set splitbelow
set splitright
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set clipboard+=unnamedplus
set hidden
set updatetime=100
set signcolumn=number
set noswapfile
set nobackup
set nowritebackup
set cursorline
" improve init time by telling nvim where python is located
let g:python3_host_prog = '/usr/bin/python3'
" improve init time by disabling language extension
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
" map m as cut 
nnoremap m d
xnoremap m d
nnoremap M D
xnoremap M D
nnoremap mm dd
xnoremap mm dd
" map d as remove
nnoremap d "_d
xnoremap d "_d
nnoremap D "_D
xnoremap D "_D
" map c as change without cut
nnoremap c "_c
xnoremap c "_c
nnoremap C "_C
xnoremap C "_C
" add yank cursor to end
nnoremap Y y$
xnoremap Y y$
" map redo
nnoremap U <C-u>
xnoremap U <C-u>
" map r as replace
function! s:ReplaceMM()
  let char1 = nr2char(getchar())
  let char2 = nr2char(getchar())
  if (col(".") + strlen(expand('<cword>')) >= col("$")-1)
    return '"_d'.char1.char2.'p'
  endif
  return '"_d'.char1.char2.'P'
endfunction
nnoremap <expr>r <SID>ReplaceMM()
" replace line without newline: move to start, delete til end, paste substituted newline line
nnoremap <expr>rr (line('.') == line('$')) ? '"_ddp' : '"_ddP'
nnoremap rG "_dGp
nnoremap R "_Dp
" map s as search
function s:SearchMM()
  let char1 = nr2char(getchar())
  let char2 = nr2char(getchar())
  return "v" . char1  . char2 . "\"hy/\<C-r>h\<CR>N"
endfunction
nnoremap s nop
nnoremap <expr> s <SID>SearchMM()
vnoremap <silent> s y/\V<C-R>=escape(@",'/\')<CR><CR>
" map space as leader
let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :noa w<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>R :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><tab> <C-w><C-w>
" turnoff /n search highlight
nnoremap <Leader> :noh<CR>
" search and replace
nnoremap <Leader>r <ESC>:%s///gc<left><left><left>
vnoremap <Leader>r :s//gc<left><left><left>

let vimplug = expand(stdpath('data') . '/site/autoload/plug.vim')
if filereadable(vimplug)
  source ~/.config/nvim/plug.vim
endif
