return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  keys = {
    { '<leader>pv', '<cmd>Oil<cr>' },
  },
}
