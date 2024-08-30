return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      delete_to_trash = true,
      use_icons = true,
      use_default_keymaps = true,
      lsp_file_methods = {
        'textDocument/codeAction',
      },
      view_options = {
        show_hidden = true,
      },
      git = {
        show_untracked = true,
        show_ignored = true,
      },
    }
  end,
}
