vim.g.mapleader = ' '

local map = vim.keymap.set

-- Remove ArrowKeys
map('n', '<Up>', '<nop>')
map('n', '<Down>', '<nop>')
map('n', '<Left>', '<nop>')
map('n', '<Right>', '<nop>')

map('n', 's', '"_d"')
-- Move between windows with gw
map('n', 'gwh', '<C-w>h')
map('n', 'gwj', '<C-w>j')
map('n', 'gwk', '<C-w>k')
map('n', 'gwl', '<C-w>l')

map('i', 'jk', '<Esc>')
-- Repeat the last macro
map('n', 'Q', '@@')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- ThePrimeagen's Remaps
map('x', '<leader>p', [["_dP]])
map({ 'n', 'v' }, '<leader>d', [["_d]])

map('n', 'Q', '<nop>')
map('n', '<leader>f', vim.lsp.buf.format)
map('n', '<leader>ef', '<cmd>EslintFixAll<CR>', { desc = '[E]slint [F]ix All' })

map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>')

map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ts only
-- map('n', '<leader>o', '<cmd>OrganizeImports<CR>', { desc = 'Organize Imports' })

map('n', '<leader>pv', '<CMD>Ex<CR>', { desc = 'Open parent directory' })

-- terminal escape keybinds
map('t', '<esc>', [[<C-\><C-n>]])
map('t', 'jk', [[<C-\><C-n>]])

map('n', '<leader>h', '<cmd>cnext<CR>zz', { desc = 'Forward qflist' })
map('n', '<leader>;', '<cmd>cprev<CR>zz', { desc = 'Backward qflist' })
