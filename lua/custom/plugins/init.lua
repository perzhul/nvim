return {
  {
    'wildfunctions/myeyeshurt',
    opts = {},
    keys = {
      {
        '<leader>ms',
        function()
          require('myeyeshurt').start()
        end,
      },
      {
        '<leader>mx',
        function()
          require('myeyeshurt').stop()
        end,
      },
    },
  },
  {
    'andrew-george/telescope-themes',
    config = function()
      require('telescope').load_extension 'themes'
      vim.keymap.set('n', '<leader>th', ':Telescope themes<CR>', { noremap = true, silent = true, desc = 'Theme Switcher' })
    end,
  },
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
    lazy = true,
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
}
