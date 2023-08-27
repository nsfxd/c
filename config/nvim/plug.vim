call plug#begin(stdpath('data') . '/plugged')
" visual
Plug 'bluz71/vim-moonfly-colors'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'noib3/nvim-cokeline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
" utils
Plug 'windwp/nvim-autopairs'
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
" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional
" Autocompletion
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'L3MON4D3/LuaSnip'         " Required
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
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
" open telescope if no fileArg onopen
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | execute 'Telescope find_files' | endif
" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
let g:slime_cell_delimiter = "#%%"
nmap <leader>c <Plug>SlimeSendCell
nmap <leader>p <Plug>SlimeParagraphSend
lua <<EOF
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
  lsp.buffer_autoformat()
end)
-- " (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()
EOF
" nnn
tnoremap <C-A-n> <cmd>NnnPicker<CR>
nnoremap <C-A-n> <cmd>NnnPicker<CR>
