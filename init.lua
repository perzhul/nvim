require 'options'

require 'keymaps'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Lazy Installation
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- 1. your hand-picked plugins
local plugins = {
  { 'tpope/vim-sleuth', event = 'BufReadPost' },
  { 'catppuccin/nvim' },
  { 'echasnovski/mini.ai', version = '*', opts = {}, event = 'VeryLazy' },
  {
    'saecki/live-rename.nvim',
    event = 'VeryLazy',
    config = function()
      local live_rename = require 'live-rename'
      vim.keymap.set('n', '<leader>r', live_rename.rename, { desc = 'LSP rename' })
    end,
  },
  { 'windwp/nvim-ts-autotag', opts = {} },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'ficcdaf/ashen.nvim' },
  { 'pustota-theme/pustota.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'miikanissi/modus-themes.nvim' },
  { 'rose-pine/neovim' },
  { 'sainnhe/gruvbox-material' },
  { 'tpope/vim-fugitive' },
  { 'folke/tokyonight.nvim' },
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
    opts = {},
  },
  { 'onsails/lspkind.nvim', opts = {} },
}

-- 2. auto-scan lua/plugins/*.lua
local plugins_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
  if file:match '%.lua$' then
    local name = file:gsub('%.lua$', '')
    table.insert(plugins, require('plugins.' .. name))
  end
end

-- 3. hand everything off to lazy.nvim
require('lazy').setup(plugins)

vim.cmd [[colorscheme tokyonight]]
