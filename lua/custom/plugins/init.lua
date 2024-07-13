return {
  'github/copilot.vim',
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
}
