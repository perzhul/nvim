vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('FzfLuaEsc', { clear = true }),
  pattern = 'fzf',
  callback = function(e)
    vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = e.buf, silent = true, nowait = true })
  end,
})
