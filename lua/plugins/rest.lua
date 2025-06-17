return {
  'rest-nvim/rest.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, 'http')
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'http',
        callback = function()
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
          end

          map('n', '<leader>rr', '<cmd>Rest run<CR>', 'Rest: Run request under cursor')
          map('n', '<leader>rl', '<cmd>Rest last<CR>', 'Rest: Rerun last request')
          map('n', '<leader>ro', '<cmd>Rest open<CR>', 'Rest: Open result buffer')
          map('n', '<leader>re', '<cmd>Rest env select<CR>', 'Rest: Select .env file')
          map('n', '<leader>rs', '<cmd>Rest env show<CR>', 'Rest: Show registered .env')
        end,
      })
    end,
  },
}
