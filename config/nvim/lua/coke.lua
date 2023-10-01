local map = vim.api.nvim_set_keymap
local get_hl_attr = require('cokeline.hlgroups').get_hl_attr
require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
          buffer.is_focused
          and get_hl_attr('Normal', 'fg')
          or get_hl_attr('Comment', 'fg')
    end,
    bg = get_hl_attr('ColorColumn', 'bg'),
  },

  components = {
    {
      text = ' ',
      bg = get_hl_attr('Normal', 'bg'),
    },
    {
      text = '',
      fg = get_hl_attr('ColorColumn', 'bg'),
      bg = get_hl_attr('Normal', 'bg'),
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
      fg = get_hl_attr('ColorColumn', 'bg'),
      bg = get_hl_attr('Normal', 'bg'),
    },
  },
})
for i = 1, 9 do
  map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
end
