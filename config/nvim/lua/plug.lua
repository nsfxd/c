require("coke")

require("nnn").setup()
require("ibl").setup()
require("substitute").setup()
vim.keymap.set("n", "r", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "rr", require('substitute').line, { noremap = true })
vim.keymap.set("n", "R", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "r", require('substitute').visual, { noremap = true })
require("nvim-autopairs").setup {}

-- local function on_attach(bufnr)
--   local api = require('nvim-tree.api')
--   local function opts(desc)
--     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end
--   api.config.mappings.default_on_attach(bufnr)
--   vim.keymap.del('n', 'd', { buffer = bufnr })
--   vim.keymap.set('n', 'd',     api.fs.trash,                          opts('Trash'))
-- end
--
-- require("nvim-tree").setup({
--   on_attach = on_attach,
-- })

require 'colorizer'.setup()
require 'nvim-treesitter.configs'.setup {
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  disable = function(lang, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end
}
require('telescope').setup {
  defaults = { file_ignore_patterns = { "node_modules", "dist", ".git" } },
  pickers = { find_files = { hidden = true } }
}

vim.g.kommentary_create_default_mappings = false
require('kommentary.config').setup()
local map = vim.api.nvim_set_keymap
map("n", "<leader>//", "<Plug>kommentary_line_default", {})
map("n", "<leader>/", "<Plug>kommentary_motion_default", {})
map("x", "<leader>/", "<Plug>kommentary_visual_default", {})

require('lualine').setup {
  options = { theme = 'ayu_dark' }
}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  }
})
