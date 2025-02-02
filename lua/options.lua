vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.wo.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- primagen opts
vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.bo.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = '80'
vim.opt.updatetime = 50

vim.opt.signcolumn = 'yes'

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.

vim.opt.termguicolors = true

-- ===========================
-- Performance and UI Optimizations
-- ===========================

-- Faster rendering during macros or complex operations
vim.opt.lazyredraw = true
-- This makes Vim only redraw the screen when necessary, improving performance during long operations.

-- Enable filetype detection, plugins, and indentation rules
vim.cmd 'filetype plugin indent on'
-- This command enables filetype-specific plugins and indentation behavior.

-- Automatically save files when switching buffers or windows
vim.opt.autowrite = true
-- Automatically write the buffer to the file when switching buffers or windows.

-- Shorten command-line messages
vim.opt.shortmess:append 'c'
-- Avoid showing redundant messages for completion.

-- More efficient folding using syntax-based folds
vim.opt.foldmethod = 'syntax'
-- Set syntax-based folding.

vim.opt.foldlevel = 99
-- Open files with all folds open by default.

-- Enable persistent sessions to save state between sessions
vim.opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
-- Save the state of buffers, current directory, tab pages, and window sizes.

-- Customize status line
vim.opt.laststatus = 2
-- Always show the status line.

-- vim: ts=2 sts=2 sw=2 et
