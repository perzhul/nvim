return {
  'sindrets/diffview.nvim',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>dvo', '<cmd>DiffviewOpen<CR>', { desc = '[D]iff[V]iew [O]pen' })
    vim.api.nvim_set_keymap('n', '<leader>dvc', '<cmd>DiffviewClose<CR>', { desc = '[D]iff[V]iew [C]lose' })
  end,
}
