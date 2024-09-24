return {
  'sindrets/diffview.nvim',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>DiffviewOpen<CR>', { desc = '[D]iff [O]pen' })
    vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = '[D]iff [C]lose' })
  end,
}
