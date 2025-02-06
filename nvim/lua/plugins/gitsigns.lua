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

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk { navigation_message = false }
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Next hunk', silent = true })

      map('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk { navigation_message = false }
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Previous hunk', silent = true })

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, { desc = 'stage/unstage hunk' })
      map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' })
      map('n', '<leader>hx', gs.reset_hunk, { desc = 'Discard changes in this hunk' })
      map('n', '<leader>gbf', gs.blame, { desc = '[G]it [B]lame for [F]ile' })
      map('n', '<leader>gbl', gs.blame_line, { desc = '[G]it [B]lame for [L]ine' })
      map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Toggle current line blame' })

      -- map('n', '<leader>hS', gs.stage_buffer)
      -- map('n', '<leader>hR', gs.reset_buffer)
      -- map('n', '<leader>hd', gs.diffthis)

      -- Text object (for selecting hunks in visual mode)
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
    end,
  },
}
