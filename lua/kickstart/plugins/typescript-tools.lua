return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      tsserver_plugins = {
        '@styled/typescript-styled-plugin',
      },
    },
    keys = {
      { '<leader>or', '<cmd>TSToolsOrganizeImports<cr>' },
      { '<leader>fa', '<cmd>TSToolsFixAll<cr>' },
    },
  },
}
