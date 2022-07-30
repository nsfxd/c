local map = vim.api.nvim_set_keymap
require'pears'.setup()
require'colorizer'.setup()
require'nvim-treesitter.configs'.setup {
   highlight = {
     enable = true,
     additional_vim_regex_highlighting = false,
   }
}
require'nvim-tree'.setup()
require('telescope').setup {
    defaults = {file_ignore_patterns = {"node_modules", "dist"}},
    pickers = {find_files = {hidden = true}}
}

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

vim.g.kommentary_create_default_mappings = false
require('kommentary.config').setup()
map("n", "<leader>//", "<Plug>kommentary_line_default", {})
map("n", "<leader>/", "<Plug>kommentary_motion_default", {})
map("x", "<leader>/", "<Plug>kommentary_visual_default", {})

require('lualine').setup {
  options = { theme  = 'ayu_dark' }
}

local get_hex = require('cokeline/utils').get_hex
require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
         or get_hex('Comment', 'fg')
    end,
    bg = get_hex('ColorColumn', 'bg'),
  },

  components = {
    {
      text = ' ',
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = function(buffer)
        return buffer.index .. '. '
      end,
      truncation = { priority = 1 }
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.filename .. '  ' end,
      style = function(buffer)
        return buffer.is_focused and 'bold' or nil
      end,
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
  },
})
for i = 1,9 do
  map('n', ('<Leader>%s'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i),  { silent = true })
end
