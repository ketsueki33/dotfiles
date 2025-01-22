-- Easily comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    -- Load the comment-context plugin
    require('ts_context_commentstring').setup {}

    -- Setup Comment.nvim
    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-/>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('v', '<C-/>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    vim.keymap.set('n', '<C-_>', require('Comment.api').toggle.linewise.current, opts)
    -- vim.keymap.set('n', '<C-c>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('v', '<C-_>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    -- vim.keymap.set('v', '<C-c>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
  end,
}

--[[ 
Comment.nvim Keymap Documentation
==================================

NORMAL mode:
  - `gcc`  : Toggles the current line using linewise comment
  - `gbc`  : Toggles the current line using blockwise comment
  - `[count]gcc` : Toggles the specified number of lines using linewise comment
  - `[count]gbc` : Toggles the specified number of lines using blockwise comment
  - `gc[count]{motion}` : (Op-pending) Toggles the region using linewise comment
  - `gb[count]{motion}` : (Op-pending) Toggles the region using blockwise comment

VISUAL mode:
  - `gc` : Toggles the selected region using linewise comment
  - `gb` : Toggles the selected region using blockwise comment

Extra mappings (enabled by default if `mappings.extra` is set in config):
  NORMAL mode:
    - `gco` : Inserts a comment on the next line and enters INSERT mode
    - `gcO` : Inserts a comment on the previous line and enters INSERT mode
    - `gcA` : Inserts a comment at the end of the current line and enters INSERT mode

Examples for linewise comments:
  - `gcw`  : Toggle comment from the current cursor position to the next word
  - `gc$`  : Toggle comment from the current cursor position to the end of line
  - `gc}`  : Toggle comment until the next blank line
  - `gc5j` : Toggle comment for 5 lines after the current cursor position
  - `gc8k` : Toggle comment for 8 lines before the current cursor position
  - `gcip` : Toggle comment inside a paragraph
  - `gca}` : Toggle comment around curly brackets

Examples for blockwise comments:
  - `gb2}` : Toggle comment until 2 blank lines ahead
  - `gbaf` : Toggle comment around a function (with LSP/treesitter support)
  - `gbac` : Toggle comment around a class (with LSP/treesitter support)
--]]
