local map = vim.keymap.set

-- Disable arrow keys in normal mode to encourage hjkl usage
map('n', '<Up>', '<nop>')
map('n', '<Down>', '<nop>')
map('n', '<Left>', '<nop>')
map('n', '<Right>', '<nop>')

-- Remap 's' in normal mode to delete char without yanking or entering insert mode
map('n', 's', '"_d"')

-- Quickly exit insert mode by typing 'jk'
map('i', 'jk', '<Esc>')

-- Move selected lines down/up in visual mode and reselect with indentation fix
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Join current line with next without moving cursor (preserves cursor position)
map('n', 'J', 'mzJ`z')

-- Scroll down/up half page and center cursor vertically
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Jump to next/previous search result and center screen & open folds
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Disable Ex mode 'Q' in normal mode (avoids accidental presses)
map('n', 'Q', '<nop>')

-- Quick search and replace for word under cursor with cursor placed for editing
map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Navigate buffers: next and previous
map('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<leader>bp', ':bprev<CR>', { noremap = true, silent = true })

-- Clear search highlighting by pressing Escape in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Jump to next/previous diagnostic with floating window
map('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end)
map('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end)

-- Show diagnostic message under cursor in floating window
map('n', '<leader>e', vim.diagnostic.open_float)

-- Open location list with diagnostics
map('n', '<leader>q', vim.diagnostic.setloclist)

-- Terminal mode: press Esc or 'jk' to exit to normal mode
map('t', '<Esc>', '<C-\\><C-n>')
map('t', 'jk', [[<C-\><C-n>]])

-- Toggle Zen Mode with <leader>z
map('n', '<leader>z', '<cmd>ZenMode<cr>')
