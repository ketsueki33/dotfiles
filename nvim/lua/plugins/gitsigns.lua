-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function()
      vim.keymap.set('n', '<leader>gbf', function()
        require('gitsigns').blame()
      end, { silent = true, noremap = true, desc = '[G]it [B]lame for [F]ile' })

      vim.keymap.set('n', '<leader>gbl', function()
        require('gitsigns').blame_line()
      end, { silent = true, noremap = true, desc = '[G]it [B]lame for [L]ine' })
    end,
  },
}
