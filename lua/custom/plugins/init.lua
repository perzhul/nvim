return {
  { 'rose-pine/neovim', name = 'rose-pine', opts = {
    styles = {
      transparency = true,
    },
  } },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'folke/tokyonight.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'projekt0n/github-nvim-theme' },
  { 'dmmulroy/ts-error-translator.nvim' },
  { 'artemave/workspace-diagnostics.nvim', lazy = true },
  {
    'saecki/live-rename.nvim',
    config = function()
      local live_rename = require 'live-rename'
      vim.keymap.set('n', '<leader>rn', live_rename.map { insert = false }, { desc = 'LSP rename' })
    end,
  },
  { 'akinsho/git-conflict.nvim', version = '*', opts = {} },
  { 'norcalli/nvim-colorizer.lua', lazy = true, opts = {} },
  'tpope/vim-fugitive',
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    lazy = true,
    opts = { color_square_width = 2 },
    config = function()
      require('cmp').config.formatting = {
        format = require('tailwindcss-colorizer-cmp').formatter,
      }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    version = '*',
    opts = {},
    keys = {
      { '<leader>tot', '<cmd>ToggleTerm size=8<CR>', desc = '[TO]ggle [T]erminal' },
    },
  },
  { 'folke/twilight.nvim', lazy = true, opts = {} },
  {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    opts = {
      hint_prefix = '🦈',
    },
  },
  {
    'sindrets/diffview.nvim',
    opts = {},
    keys = {
      { '<leader>do', '<cmd>DiffviewOpen<CR>', desc = '[D]iff [O]pen' },
      { '<leader>dc', '<cmd>DiffviewClose<CR>', desc = '[D]iff [C]lose' },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
    keys = {
      { '<leader>or', '<cmd>OverseerRun<CR>', { desc = '[O]verseer [R]un' } },
      { '<leader>ot', '<cmd>OverseerToggle<CR>', { desc = '[O]verseer [T]oggle' } },
      { '<leader>orl', '<cmd>OverseerRestartLast<CR>', { desc = '[O]verseer [R]estart [L]ast' } },
    },
  },
  {
    'kylechui/nvim-surround',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    lazy = false,
  },
}
