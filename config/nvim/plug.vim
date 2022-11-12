call plug#begin(stdpath('data') . '/plugged')
" visual
Plug 'bluz71/vim-moonfly-colors'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'noib3/nvim-cokeline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
" utils
Plug 'steelsojka/pears.nvim'
Plug 'b3nj5m1n/kommentary'
Plug 'tpope/vim-abolish'
Plug 'norcalli/nvim-colorizer.lua'
" telescope and nnn
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'luukvbaal/nnn.nvim'
" Lsp and syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" repl 
Plug 'jpalardy/vim-slime'
call plug#end()
colorscheme moonfly
hi TabLineFill guibg=None
lua require("plug")
" telescope
nnoremap <Leader>f <cmd>Telescope find_files<cr>
nnoremap <Leader>g <cmd>Telescope live_grep<cr>
nnoremap <Leader>b <cmd>Telescope buffers<cr>
" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
let g:slime_cell_delimiter = "#%%"
nmap <leader>c <Plug>SlimeSendCell
nmap <leader>p <Plug>SlimeParagraphSend
let g:slime_python_ipython = 1
" nnn
nnoremap <leader>n <cmd>NnnPicker<CR>
" coc
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <leader>k <Plug>(coc-diagnostic-prev)
nmap <leader>j <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nmap <leader>a  <Plug>(coc-codeaction)
