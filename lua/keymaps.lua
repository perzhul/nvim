-- [[ Basic Keymaps ]]
--  See `:help map()`

vim.g.mapleader = ' '

local map = vim.keymap.set

-- Remove ArrowKeys
map('n', '<Up>', '<nop>')
map('n', '<Down>', '<nop>')
map('n', '<Left>', '<nop>')
map('n', '<Right>', '<nop>')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- ThePrimeagen's Remaps
map('x', '<leader>p', [["_dP]])
map({ 'n', 'v' }, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])
map({ 'n', 'v' }, '<leader>d', [["_d]])

map('n', 'Q', '<nop>')
map('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
map('n', '<leader>f', vim.lsp.buf.format)
map('n', '<leader>ef', '<cmd>EslintFixAll<CR>', { desc = '[E]slint [F]ix All' })

map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map('n', '<leader>hh', '<cmd>cnext<CR>zz', { desc = 'Go to next quickfix item' })
map('n', '<leader>;', '<cmd>cprev<CR>zz', { desc = 'Go to previous quickfix item' })
map('n', '<leader>cc', '<cmd>cclose<CR>', { desc = 'Close quickfix list' })

map('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map('n', '<leader>xx', '<cmd>!chmod +x %<CR>', { silent = true })

map('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>')

map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

map('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })
map('n', '<leader><leader>', function()
  vim.cmd 'so'
end)

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<leader>o', '<cmd>OrganizeImports<CR>', { desc = 'Organize Imports' })

map('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
map('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
map('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
map('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
map('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
map('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
