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
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  { 'tpope/vim-sleuth', event = "BufReadPost" },
  { 'catppuccin/nvim' },
  { "saecki/live-rename.nvim", config = function()
    local live_rename = require("live-rename")
    vim.keymap.set("n", "<leader>r", live_rename.rename, { desc = "LSP rename" })
  end },
  require 'plugins.treesitter',
  require 'plugins.blink',
  require 'plugins.lspconfig',
  require 'plugins.autopairs',
  require 'plugins.fzf',
  require 'plugins.aerial',
}

vim.cmd('colorscheme catppuccin')
