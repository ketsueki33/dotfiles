return {
  'NeogitOrg/neogit',
  main = 'neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    require('neogit').setup()
    vim.keymap.set('n', '<leader>g', function()
      require('neogit').open()
    end, { desc = 'Open Neogit', noremap = true, silent = true })
  end,
}
