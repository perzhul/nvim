return {
  -- 'github/copilot.vim',
  'eandrju/cellular-automaton.nvim',
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },
  'ThePrimeagen/vim-be-good',
  { 'artemave/workspace-diagnostics.nvim' },
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      require('render-markdown').setup {}
    end,
  },
  'artemave/workspace-diagnostics.nvim',
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {
      hint_prefix = '💅 ',
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
  {
    'saecki/live-rename.nvim',
    config = function() end,
  },
  'workspace-diagnostics.nvim',
}
