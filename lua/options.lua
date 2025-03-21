vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

-- Basic Editor Behavior
vim.opt.mouse = 'a' -- Enable mouse support in all modes.
vim.opt.clipboard = 'unnamedplus' -- Use the system clipboard.
vim.opt.ignorecase = true -- Case-insensitive searching...
vim.opt.smartcase = true -- ...unless uppercase is used.
vim.opt.undofile = true -- Enable persistent undo.
vim.opt.termguicolors = true -- Use true colors in the terminal.
vim.opt.updatetime = 50 -- Faster completion and swap file updates.

-- Display Options
vim.opt.number = true -- Enable absolute line numbers.
vim.opt.relativenumber = true -- ...and relative numbers.
vim.opt.cursorline = true -- Highlight the current line.
vim.opt.signcolumn = 'yes' -- Always show the sign column.
vim.opt.laststatus = 2 -- Always display the status line.
vim.opt.colorcolumn = '80'

-- Editing & Indentation
vim.opt.tabstop = 4 -- Number of spaces a Tab counts for.
vim.opt.shiftwidth = 4 -- Size of an indent.
vim.opt.softtabstop = 4 -- Fine-tuning backspace behavior.
vim.opt.expandtab = true -- Convert tabs to spaces.
vim.opt.smartindent = true -- Automatically insert indents on new lines.

-- Search & Substitution
vim.opt.hlsearch = true -- Highlight search matches.
vim.opt.incsearch = true -- Show incremental search results.
vim.opt.inccommand = 'split' -- Live preview for substitutions.

-- Window Behavior
vim.opt.splitright = true -- New vertical splits open to the right.
vim.opt.splitbelow = true -- New horizontal splits open below.
vim.opt.scrolloff = 8 -- Keep some lines visible around the cursor.
vim.opt.wrap = false -- Disable line wrapping.
vim.opt.showmode = false

-- Performance Optimizations
vim.opt.lazyredraw = true -- Redraw only when necessary.

-- Filetype & Plugin Support
vim.cmd 'filetype plugin indent on' -- Enable filetype detection, plugins, and indentation.
