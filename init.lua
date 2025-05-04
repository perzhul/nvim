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
  { 'tpope/vim-sleuth',    event = "BufReadPost" },
  { 'catppuccin/nvim' },
  { 'echasnovski/mini.ai', version = '*',        opts = {}, event = "VeryLazy" },
  { "saecki/live-rename.nvim", event = "VeryLazy", config = function()
    local live_rename = require("live-rename")
    vim.keymap.set("n", "<leader>r", live_rename.rename, { desc = "LSP rename" })
  end },
  { "windwp/nvim-ts-autotag",          opts = {} },
  { 'projekt0n/github-nvim-theme',     name = 'github-theme' },
  { "ellisonleao/gruvbox.nvim" },
  { "ficcdaf/ashen.nvim" },
  { "pustota-theme/pustota.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "miikanissi/modus-themes.nvim" },
  { "rose-pine/neovim" },
  { "sainnhe/gruvbox-material" },
  { 'tpope/vim-fugitive' },
  { 'folke/tokyonight.nvim' },
  { "stevearc/oil.nvim", opts = {
    view_options = {
      show_hidden = true,
    },
  },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  { "onsails/lspkind.nvim", opts = {} },
  require 'plugins.treesitter',
  require 'plugins.blink',
  require 'plugins.lspconfig',
  require 'plugins.autopairs',
  require 'plugins.fzf',
  require 'plugins.aerial',
  require 'plugins.treesitter-objects',
  require 'plugins.go',
  require 'plugins.gitsigns',
  require 'plugins.better-ts-errors',
  require 'plugins.conform',
}


vim.cmd('colorscheme tokyonight')
