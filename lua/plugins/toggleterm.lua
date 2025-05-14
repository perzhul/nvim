return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      on_open = function(term)
        local opts = { noremap = true }
        if term.cmd ~= 'lazygit' then
          vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', [[<C-\><C-n>]], opts)
        end
      end,
    }
  end,
  keys = {
    { '<leader>/', '<cmd>ToggleTerm direction=horizontal<cr>' },
  },
  cmd = 'ToggleTerm',
}
