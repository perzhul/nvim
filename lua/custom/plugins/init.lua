return {
  'nyoom-engineering/oxocarbon.nvim',
  'folke/tokyonight.nvim',
  'EdenEast/nightfox.nvim',
  'projekt0n/github-nvim-theme',
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function()
      require('todo-comments').setup()
      vim.keymap.set('n', ']t', function()
        require('todo-comments').jump_next()
      end, { desc = 'Next todo comment' })

      vim.keymap.set('n', '[t', function()
        require('todo-comments').jump_prev()
      end, { desc = 'Previous todo comment' })
    end,
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
