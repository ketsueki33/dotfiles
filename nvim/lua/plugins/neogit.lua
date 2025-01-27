return {
  'NeogitOrg/neogit',
  main = 'neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    require('neogit').setup {
      graph_style = 'kitty',
      integrations = {
        diffview = true,
        telescope = true,
      },
    }
    vim.keymap.set('n', '<leader>gg', function()
      require('neogit').open()
    end, { desc = 'Open Neogit', noremap = true, silent = true })
  end,
}
