require 'options'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'tpope/vim-sleuth', event = 'BufReadPost' },
  { 'echasnovski/mini.ai', opts = {}, event = 'VeryLazy' },
  { 'tpope/vim-unimpaired', event = 'BufReadPost' },
  { 'kylechui/nvim-surround', event = 'InsertEnter', opts = {} },
  { 'artemave/workspace-diagnostics.nvim' },
  { 'eandrju/cellular-automaton.nvim' },
  { 'wakatime/vim-wakatime', lazy = false, opts = {} },
  { 'folke/zen-mode.nvim', opts = { window = { width = 120 } } },
  {
    'jaredgorski/Mies.vim',
    config = function()
      vim.cmd [[set background=light]]
      vim.cmd [[colorscheme mies]]
    end,
  },
}

local plugins_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
  if file:match '%.lua$' then
    local name = file:gsub('%.lua$', '')
    table.insert(plugins, require('plugins.' .. name))
  end
end

require('lazy').setup(plugins)
