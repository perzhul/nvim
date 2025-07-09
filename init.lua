require 'options'
require 'keymaps'

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'http',
  callback = function()
    vim.bo.commentstring = '# %s' -- helpful for `rest.nvim`
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'tpope/vim-sleuth', event = 'BufReadPost' },
  { 'echasnovski/mini.ai', version = '*', opts = {}, event = 'VeryLazy' }, -- cool plugin, doesn't have to do nothing with AI, don't remove
  {
    'saecki/live-rename.nvim',
    event = 'VeryLazy',
    config = function()
      local live_rename = require 'live-rename'
      vim.keymap.set('n', '<leader>r', live_rename.rename, { desc = 'LSP rename' })
    end,
  },
  { 'windwp/nvim-ts-autotag', ft = { 'html', 'htmldjango', 'xml', 'javascriptreact', 'typescriptreact' }, opts = {} },
  { 'tpope/vim-fugitive', cmd = { 'Git', 'Gdiffsplit', 'Gvdiffsplit', 'Gread', 'Gwrite' } },
  { 'tpope/vim-unimpaired', event = 'BufReadPost' },
  {
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'InsertEnter',
    opts = {},
  },
  { 'artemave/workspace-diagnostics.nvim' },
  { 'eandrju/cellular-automaton.nvim' },
  { 'wakatime/vim-wakatime', lazy = false, opts = {} },
  { 'folke/zen-mode.nvim', opts = {} },
  { 'ellisonleao/gruvbox.nvim' },
  { 'jaredgorski/Mies.vim' },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  { 'forest-nvim/sequoia.nvim' },
  { 'rose-pine/neovim' },
  { 'rebelot/kanagawa.nvim' },
}

local plugins_dir = vim.fn.stdpath 'config' .. '/lua/plugins'
for _, file in ipairs(vim.fn.readdir(plugins_dir)) do
  if file:match '%.lua$' then
    local name = file:gsub('%.lua$', '')
    table.insert(plugins, require('plugins.' .. name))
  end
end

require('lazy').setup(plugins)

vim.cmd.colorscheme 'kanagawa'

-- local hr = tonumber(os.date('%H', os.time()))
-- if hr > 6 and hr < 20 then
--   vim.o.background = 'light'
-- else
--   vim.opt.background = 'dark'
-- end
