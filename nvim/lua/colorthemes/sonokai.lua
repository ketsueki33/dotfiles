return {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_style = 'andromeda'
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_transparent_background = true
    vim.g.sonokai_show_eob = 0
    vim.g.sonokai_diagnostic_text_highlight = 1
    -- vim.g.sonokai_current_word = 'grey background'  -- Values :`'grey background'`, `'high contrast background'`, `'bold'`, `'underline'`, `'italic'`

    -- load the colorscheme
    vim.cmd.colorscheme 'sonokai'

    -- Toggle background transparency
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.sonokai_transparent_background = bg_transparent
      vim.cmd [[colorscheme sonokai]]
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
