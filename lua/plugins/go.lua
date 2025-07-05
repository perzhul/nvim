return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup()
    -- Run gofmt + goimports on save

    local format_sync_grp = vim.api.nvim_create_augroup('goimports', {})
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
        require('go.format').goimports()
      end,
      group = format_sync_grp,
    })

    -- Mappings
    local map = vim.keymap.set

    map('n', '<leader>gr', '<cmd>:GoRun<cr>')
    map('n', '<leader>ie', '<cmd>:GoIfErr<cr>')
    map('n', '<leader>fs', '<cmd>:GoFillStruct<cr>')
    map('n', '<leader>at', '<cmd>:GoAddTag<cr>')
    map('n', '<leader>rt', '<cmd>:GoRmTag<cr>')
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
