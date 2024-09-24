return {
  'artemave/workspace-diagnostics.nvim',
  'saecki/live-rename.nvim',
  'folke/drop.nvim',
  'xiyaowong/transparent.nvim',
  { 'stevearc/dressing.nvim', opts = {} },
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
    -- optionally, override the default options:
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
}
