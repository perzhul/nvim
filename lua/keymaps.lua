-- [[ Basic Keymaps ]]
--  See `:help map()`

local silent_noremap = { silent = true, noremap = true }

local map = vim.keymap.set

map('n', '<leader>w', '<cmd>update<cr>', { desc = 'save buffer' })

vim.g.mapleader = ' '
-- map('n', '<leader>pv', vim.cmd.Ex)

map('n', '<leader>-', ':sp<CR><C-w>j', silent_noremap)
map('n', '<leader>_', ':vsp<CR><C-w>l', silent_noremap)

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

-- greatest remap ever
map('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
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

vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
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

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

map('n', '<leader>o', '<cmd>OrganizeImports<CR>', { desc = 'Organize Imports' })
map('n', '<leader>gh', '<cmd>Telescope git_file_history<CR>', { desc = 'Open git file history' })
map('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

map('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
map('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
map('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
map('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
map('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab
-- vim: ts=2 sts=2 sw=2 et
