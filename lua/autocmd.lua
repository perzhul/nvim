vim.api.nvim_create_user_command('OverseerRestartLast', function()
  local overseer = require 'overseer'
  local tasks = overseer.list_tasks { recent_first = true }
  if vim.tbl_isempty(tasks) then
    vim.notify('No tasks found', vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], 'restart')
  end
end, {})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
      return
    end
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  callback = function()
    vim.cmd 'VtsExec remove_unused_imports'
  end,
})
