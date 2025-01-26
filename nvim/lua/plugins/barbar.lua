return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false -- Disable auto-setup to configure manually
  end,
  opts = {
    -- Plugin options (if needed)
    animation = true,
    semantic_letters = true,

    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,
    -- Sets the minimum padding width with which to surround each tab
    minimum_padding = 1,

    highlight_visible = false,
    highlight_inactive_file_icons = false,

    icons = {
      -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
      -- buffer_index = false,
      -- buffer_number = 'superscript',
      button = '',
      -- Enables / disables diagnostic symbols
      diagnostics = { { enabled = true }, { enabled = true } },
      -- diagnostics = {
      --   enabled = true,
      --   -- [vim.diagnostic.severity.ERROR] = { enabled = true, icon = '' },
      --   -- [vim.diagnostic.severity.WARN] = { enabled = false },
      --   -- [vim.diagnostic.severity.INFO] = { enabled = false },
      --   -- [vim.diagnostic.severity.HINT] = { enabled = true },
      -- },
      -- gitsigns = {
      --   added = { enabled = true, icon = '+' },
      --   changed = { enabled = true, icon = '~' },
      --   deleted = { enabled = true, icon = '-' },
      -- },
      -- separator = { left = '▎', right = '' },

      -- If true, add an additional separator at the end of the buffer list
      -- separator_at_end = true,

      -- Configure the icons on the bufferline when modified or pinned.
      -- Supports all the base icon options.
      modified = { button = '●' },
      pinned = { button = '', filename = false },

      -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
      preset = 'default',

      -- Configure the icons on the bufferline based on the visibility of a buffer.
      -- Supports all the base icon options, plus `modified` and `pinned`.
      alternate = { filetype = { enabled = false } },
      current = { buffer_index = false },
      -- inactive = { button = '×' },
      -- visible = { modified = { buffer_number = false } },
    },
  },
  config = function(_, opts)
    require('barbar').setup(opts) -- Manually setup Barbar with options

    -- ** Overiding Diagnostic Highlights on Tabs **
    vim.api.nvim_set_hl(0, 'BufferCurrentERROR', { link = 'DiagnosticFloatingError' }) -- Link to DiagnosticFloatingError
    vim.api.nvim_set_hl(0, 'BufferVisibleERROR', { link = 'DiagnosticFloatingError' }) -- Link to DiagnosticFloatingError
    vim.api.nvim_set_hl(0, 'BufferInactiveERROR', { link = 'DiagnosticFloatingError' }) -- Link to DiagnosticFloatingError

    vim.api.nvim_set_hl(0, 'BufferCurrentWARN', { link = 'DiagnosticFloatingWarn' }) -- Link to DiagnosticFloatingWarn
    vim.api.nvim_set_hl(0, 'BufferVisibleWARN', { link = 'DiagnosticFloatingWarn' }) -- Link to DiagnosticFloatingWarn
    vim.api.nvim_set_hl(0, 'BufferInactiveWARN', { link = 'DiagnosticFloatingWarn' }) -- Link to DiagnosticFloatingWarn

    vim.api.nvim_set_hl(0, 'BufferCurrentHINT', { link = 'DiagnosticFloatingHint' }) -- Link to DiagnosticFloatingHint
    vim.api.nvim_set_hl(0, 'BufferVisibleHINT', { link = 'DiagnosticFloatingHint' }) -- Link to DiagnosticFloatingHint
    vim.api.nvim_set_hl(0, 'BufferInactiveHINT', { link = 'DiagnosticFloatingHint' }) -- Link to DiagnosticFloatingHint

    vim.api.nvim_set_hl(0, 'BufferCurrentINFO', { link = 'DiagnosticFloatingInfo' }) -- Link to DiagnosticFloatingInfo
    vim.api.nvim_set_hl(0, 'BufferVisibleINFO', { link = 'DiagnosticFloatingInfo' }) -- Link to DiagnosticFloatingInfo
    vim.api.nvim_set_hl(0, 'BufferInactiveINFO', { link = 'DiagnosticFloatingInfo' }) -- Link to DiagnosticFloatingInfo

    -- ** KEY MAPPINGS **
    local map = vim.api.nvim_set_keymap
    local kopts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', kopts)
    map('n', '<A-.>', '<Cmd>BufferNext<CR>', kopts)

    -- Re-order to previous/next
    map('n', '<S-A-,>', '<Cmd>BufferMovePrevious<CR>', kopts)
    map('n', '<S-A-.>', '<Cmd>BufferMoveNext<CR>', kopts)

    -- Goto buffer in position...
    map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', kopts)
    map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', kopts)
    map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', kopts)
    map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', kopts)
    map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', kopts)
    map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', kopts)
    map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', kopts)
    map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', kopts)
    map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', kopts)
    map('n', '<A-0>', '<Cmd>BufferLast<CR>', kopts)

    -- Pin/unpin buffer
    map('n', '<A-p>', '<Cmd>BufferPin<CR>', kopts)

    -- Goto pinned/unpinned buffer
    --                 :BufferGotoPinned
    --                 :BufferGotoUnpinned

    -- Close buffer
    map('n', '<leader>x', '<Cmd>BufferClose<CR>', kopts)

    -- shift to last active buffer
    map('n', '<S-Tab>', '<C-^>', { desc = 'Switch to the previous buffer', unpack(kopts) })

    -- Wipeout buffer
    --                 :BufferWipeout

    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight

    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', kopts)
    map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', kopts)

    -- Sort automatically by...
    map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', kopts)
    map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', kopts)
    map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', kopts)
    map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', kopts)
    map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', kopts)

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
  end,
  version = '^1.0.0',
}
