-- Custom code snippets for different purposes

-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- -- Appearance of diagnostics
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    -- Add a custom format function to show error codes
    format = function(diagnostic)
      local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
      return string.format('%s %s', code, diagnostic.message)
    end,
  },
  underline = true,
  severity_sort = { true, reverse = false },
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
  -- Make diagnostic background bg & fg match theme
  on_ready = function()
    vim.cmd [[
      highlight link DiagnosticVirtualTextError DiagnosticError
      highlight link DiagnosticVirtualTextWarn DiagnosticWarn
      highlight link DiagnosticVirtualTextInfo DiagnosticInfo
      highlight link DiagnosticVirtualTextHint DiagnosticHint
    ]]
  end,

  --   -- Make diagnostic background transparent
  --   on_ready = function()
  --     vim.cmd 'highlight DiagnosticVirtualText guibg=NONE'
  --   end,
}

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
