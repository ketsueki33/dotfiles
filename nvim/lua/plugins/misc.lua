-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- Tmux & split window navigation
    --'christoomey/vim-tmux-navigator',
  },
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    -- 'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    -- 'tpope/vim-rhubarb',
  },
  {
    -- smooth scrolling
    'karb94/neoscroll.nvim',
    opts = {},
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Auto-closing and renaming tags for HTML and similar files
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      }
    end,
  },
  {
    -- Wrapping with HTML Tags using emmet
    'olrtg/nvim-emmet',
    config = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>we', require('nvim-emmet').wrap_with_abbreviation, { desc = '[W]rap with [E]mmet Tag' })
    end,
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      local ok, colorizer = pcall(require, 'colorizer')
      if not ok then
        return
      end

      colorizer.setup({ 'css', 'javascript', 'lua', 'vim', 'toml', 'svelte', 'typescript', 'tsx', 'jsx' }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background, virtualtext
        mode = 'background', -- Set the display mode
      })
    end,
  },
}
