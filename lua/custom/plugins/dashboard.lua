return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      config = {
        header = require('ascii').art.animals.cats.boxy,
        date_format = '%Y-%m-%d %H:%M:%S',
        directories = {
          '~/.dotfiles',
          '~/work',
          '~/work/drill-cluster/',
          '~/personal',
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons', 'MaximilianLloyd/ascii.nvim', 'MunifTanjim/nui.nvim' } },
}
