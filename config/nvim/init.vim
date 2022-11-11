"base config
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
" BASE MAPPINGS
inoremap jj <ESC>
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
" map r as replace
function! s:ReplaceMM()
  let char1 = nr2char(getchar())
  let char2 = nr2char(getchar())
  return "\"_d" . char1  . char2 . "\P"
endfunction
nnoremap <expr> r <SID>ReplaceMM()
nnoremap rG "_dGpj
nnoremap R "_Dp
" replace line without newline: move to start, delete til end, paste substituted newline line
nnoremap <silent> rr "_ddP
" map s as search
function s:SearchMM()
  let char1 = nr2char(getchar())
  let char2 = nr2char(getchar())
  return "v" . char1  . char2 . "\"hy/\<C-r>h\<CR>"
endfunction
nnoremap <expr> s <SID>SearchMM()
vnoremap <silent> s y/\V<C-R>=escape(@",'/\')<CR><CR>
" turnoff /n search highlight
nnoremap <C-n> :noh<CR>
" map space as leader
let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :noa w<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>R :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><tab> <C-w><C-w>
" search and replace
nnoremap <Leader>r <ESC>:%s///gc<left><left><left>
" improve init time by telling nvim where python is located
let g:python3_host_prog = '/usr/bin/python3'

let vimplug = expand(stdpath('data') . '/site/autoload/plug.vim')
if filereadable(vimplug)
  source ~/.config/nvim/plug.vim
endif
