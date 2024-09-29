return {
  'artemave/workspace-diagnostics.nvim',
  {
    'saecki/live-rename.nvim',
    config = function()
      local live_rename = require 'live-rename'
      vim.keymap.set('n', '<leader>r', live_rename.map { insert = false }, { desc = 'LSP rename' })
    end,
  },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '\\', vim.cmd.UndotreeToggle)
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    config = function()
      require('tailwindcss-colorizer-cmp').setup {
        color_square_width = 2,
      }
      require('cmp').config.formatting = {
        format = require('tailwindcss-colorizer-cmp').formatter,
      }
    end,
  },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  {
    'huyvohcmc/atlas.vim',
    config = function()
      vim.cmd [[colorscheme atlas]]
    end,
  },
}
