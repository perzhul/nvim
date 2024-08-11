return {
  'rafi/awesome-vim-colorschemes',
  'miikanissi/modus-themes.nvim',
  'nyoom-engineering/oxocarbon.nvim',
  {
    'catppuccin/nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'modus'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
