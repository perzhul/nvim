-- Leader key
vim.g.mapleader = ' ' -- Set <leader> to space
vim.g.maplocalleader = ' ' -- Set <localleader> to space

-- Basic Editor Behavior
vim.opt.mouse = 'a' -- Enable mouse support in all modes
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.ignorecase = true -- Case-insensitive search...
vim.opt.smartcase = true -- ...unless uppercase letters are used
vim.opt.undofile = true -- Enable persistent undo
vim.opt.termguicolors = true -- Enable true color support

-- Display
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.signcolumn = 'yes' -- Always show the sign column

-- Indentation
vim.opt.tabstop = 8 -- Display tabs as 8 spaces
vim.opt.softtabstop = 4 -- Tab key inserts 4 spaces
vim.opt.shiftwidth = 4 -- Indent by 4 spaces
vim.opt.expandtab = false -- Use tabs, not spaces

-- Search
vim.opt.hlsearch = true -- Highlight all search matches
vim.opt.incsearch = true -- Show match as you type

-- Splits
vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below

-- Minimal performance tweaks
vim.opt.updatetime = 50 -- Faster update time (for CursorHold, etc.)

-- Filetype support
vim.cmd 'filetype plugin indent on' -- Enable filetype plugins and indentation

-- UI tweaks
vim.opt.showmode = false -- Don't show mode in command line (e.g. -- INSERT --)
vim.opt.colorcolumn = '80' -- Highlight column 80 (code width guide)
