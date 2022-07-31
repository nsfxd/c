call plug#begin(stdpath('data') . '/plugged')
" visual
Plug 'bluz71/vim-moonfly-colors'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'noib3/nvim-cokeline'
Plug 'nvim-lualine/lualine.nvim'
" utils
Plug 'steelsojka/pears.nvim'
Plug 'b3nj5m1n/kommentary'
Plug 'tpope/vim-abolish'
Plug 'norcalli/nvim-colorizer.lua'
" treesitter and file explorer utils
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'
" lsp and treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'
" LSP Support
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
" nvim-tree
nnoremap <leader>e :NvimTreeToggle<CR>
" lsp
nnoremap <Leader>k :lua vim.diagnostic.goto_prev()<CR>
nnoremap <Leader>j :lua vim.diagnostic.goto_prev()<CR>
