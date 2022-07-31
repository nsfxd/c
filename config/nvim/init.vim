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
" nnoremap <silent> rr 0"_D:let @+ = substitute(@+, "\n", "", "g")<CR>p
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
""call plug#begin(stdpath('data') . '/plugged')
""" visual
""Plug 'bluz71/vim-moonfly-colors'
""Plug 'kyazdani42/nvim-web-devicons'
""Plug 'norcalli/nvim-colorizer.lua'
""" utils
""Plug 'steelsojka/pears.nvim'
""Plug 'b3nj5m1n/kommentary'
""Plug 'tpope/vim-abolish'
""Plug 'norcalli/nvim-colorizer.lua'
""" " utils
""Plug 'nvim-lua/popup.nvim'
""Plug 'nvim-lua/plenary.nvim'
""Plug 'nvim-telescope/telescope.nvim'
""Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
""Plug 'kyazdani42/nvim-tree.lua'
""" " coc
""Plug 'neoclide/coc.nvim', {'branch': 'release'}
""" " repl
""Plug 'jpalardy/vim-slime'
""" " slime
""" Plug 'nvim-orgmode/orgmode'
""call plug#end()
""" " lua require("plugins")
""colorscheme moonfly
""lua <<EOF
""require'pears'.setup()
""require'colorizer'.setup()
""require('telescope').setup {
""    defaults = {file_ignore_patterns = {"node_modules", "dist"}},
""    pickers = {find_files = {hidden = true}}
""}
""require'nvim-treesitter.configs'.setup {
""   ensure_installed = "all",
""   highlight = {
""     enable = true,
""     additional_vim_regex_highlighting = false,
""   }
""}
""require'nvim-tree'.setup()
""EOF
""" telescope
""nnoremap <Leader>f <cmd>Telescope find_files<cr>
""nnoremap <Leader>g <cmd>Telescope live_grep<cr>
""nnoremap <Leader>b <cmd>Telescope buffers<cr>
""" " " vim-slime
""let g:slime_target = "tmux"
""let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
""let g:slime_dont_ask_default = 1
""let g:slime_cell_delimiter = "#%%"
""nmap <leader>c <Plug>SlimeSendCell
""nmap <leader>p <Plug>SlimeParagraphSend
""let g:slime_python_ipython = 1
""" " " nvim-tree
""nnoremap <leader>e :NvimTreeToggle<CR>
""" " "coc
""set shortmess+=c
""inoremap <silent><expr> <TAB>
""      \ pumvisible() ? "\<C-n>" :
""      \ <SID>check_back_space() ? "\<TAB>" :
""      \ coc#refresh()
""inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
""function! s:check_back_space() abort
""  let col = col('.') - 1
""  return !col || getline('.')[col - 1]  =~# '\s'
""endfunction
""nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
""nmap <silent> <leader>j <Plug>(coc-diagnostic-next)
""nmap <silent> gd <Plug>(coc-definition)
""nmap <silent> gy <Plug>(coc-type-definition)
""nmap <silent> gi <Plug>(coc-implementation)
""nmap <silent> gr <Plug>(coc-references)
""nnoremap <silent> gk :call <SID>show_documentation()<CR>
""au BufWrite *.py call CocActionAsync('format')
