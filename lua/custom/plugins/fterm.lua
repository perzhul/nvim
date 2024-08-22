return {
  'numToStr/FTerm.nvim',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('FTerm').setup {
      border = 'rounded',
      dimensions = {
        height = 0.9,
        width = 0.9,
        x = 0.5,
        y = 0.5,
      },
    }
    vim.keymap.set('n', '<leader>ff', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<leader>ff', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
