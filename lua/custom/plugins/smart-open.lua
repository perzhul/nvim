return {
  'danielfalk/smart-open.nvim',
  branch = '0.2.x',
  opts = {},
  dependencies = {
    'kkharji/sqlite.lua',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    'nvim-tree/nvim-web-devicons',
  },
}
