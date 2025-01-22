return {
  -- Highlight todo, notes, etc in comments
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = true },
  config = function()
    require('todo-comments').setup()

    -- Keybindings for navigating todo comments
    vim.keymap.set('n', ']t', function()
      require('todo-comments').jump_next()
    end, { desc = 'Next todo comment', noremap = true, silent = true })
    vim.keymap.set('n', '[t', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment', noremap = true, silent = true })
    -- Add keybinding for TodoTelescope
    vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>', { desc = '[S]earch [T]ODOs', noremap = true, silent = true })
  end,
}
