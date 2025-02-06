return {
  'sindrets/diffview.nvim',
  lazy = true,
  config = function()
    require('diffview').setup {
      view = {
        default = {
          layout = 'diff2_horizontal',
        },
        merge_tool = {
          layout = 'diff3_mixed',
        },
        file_history = {
          layout = 'diff2_horizontal',
        },
      },
    }
  end,
}
