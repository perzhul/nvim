-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic Editor Behavior
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.termguicolors = true

-- Display
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal performance tweaks
vim.opt.updatetime = 50

-- Filetype support
vim.cmd 'filetype plugin indent on'

vim.opt.colorcolumn = nil

-- Line numbers etc in Netrw
vim.cmd [[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']]

vim.opt.showmode = false
vim.opt.colorcolumn = '80'
