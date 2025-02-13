return {
  {
    'drewxs/ash.nvim',
    lazy = false,
    priority = 1000,
  },
  'Alligator/accent.vim',
  'LuRsT/austere.vim',
  'aditya-azad/candle-grey',
  'fxn/vim-monochrome',
  'rose-pine/neovim',
  'huyvohcmc/atlas.vim',
  'owickstrom/vim-colors-paramount',
  'ribru17/bamboo.nvim',
  { 'catppuccin/nvim', name = 'catppuccin' },
  'dgox16/oldworld.nvim',
  'rebelot/kanagawa.nvim',
  'AlexvZyl/nordic.nvim',
  'cdmill/neomodern.nvim',
  { 'norcalli/nvim-colorizer.lua', opts = {} },
  { 'letieu/hacker.nvim', opts = {} },
  'slugbyte/lackluster.nvim',
  'tiagovla/tokyodark.nvim',
  'polirritmico/monokai-nightasty.nvim',
  'bluz71/vim-moonfly-colors',
  'bluz71/vim-nightfly-colors',
  'Tsuzat/NeoSolarized.nvim',
  'jacoborus/tender.vim',
  'AndrewRadev/dealwithit.vim',
  'catppuccin/nvim',
  'ficcdaf/ashen.nvim',
  'craftzdog/solarized-osaka.nvim',
  'morhetz/gruvbox',
  'dracula/vim',
  'sainnhe/everforest',
  'NLKNguyen/papercolor-theme',
  'nyoom-engineering/oxocarbon.nvim',
  'metalelf0/jellybeans-nvim',
  'Shatur/neovim-ayu',
  'folke/tokyonight.nvim',
  'EdenEast/nightfox.nvim',
  'projekt0n/github-nvim-theme',
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  { 'rose-pine/neovim', name = 'rose-pine', opts = {
    styles = {
      transparency = true,
    },
  } },
  { 'dmmulroy/ts-error-translator.nvim', opts = {} },
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
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    opts = {
      hint_prefix = '🦈',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },
}
