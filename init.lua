require 'options'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'tpope/vim-sleuth', event = 'BufReadPost' },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    event = 'VimEnter',
  },
  { 'echasnovski/mini.ai', version = '*', opts = {}, event = 'VeryLazy' },
  {
    'saecki/live-rename.nvim',
    event = 'VeryLazy',
    config = function()
      local live_rename = require 'live-rename'
      vim.keymap.set('n', '<leader>r', live_rename.rename, { desc = 'LSP rename' })
    end,
  },
  { 'windwp/nvim-ts-autotag', ft = { 'html', 'htmldjango', 'xml', 'javascriptreact', 'typescriptreact' }, opts = {} },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'ficcdaf/ashen.nvim' },
  { 'pustota-theme/pustota.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'miikanissi/modus-themes.nvim' },
  { 'rose-pine/neovim' },
  { 'sainnhe/gruvbox-material' },
  { 'tpope/vim-fugitive', cmd = { 'Git', 'Gdiffsplit', 'Gvdiffsplit', 'Gread', 'Gwrite' } },
  { 'tpope/vim-unimpaired', event = 'BufReadPost' },
  { 'folke/tokyonight.nvim' },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufReadPost',
    opts = {},
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'InsertEnter',
    opts = {},
  },
  { 'rebelot/kanagawa.nvim' },
  { 'artemave/workspace-diagnostics.nvim' },
}

local plugins_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
  if file:match '%.lua$' then
    local name = file:gsub('%.lua$', '')
    table.insert(plugins, require('plugins.' .. name))
  end
end

require('lazy').setup(plugins)

vim.cmd [[colorscheme solarized-osaka]]
