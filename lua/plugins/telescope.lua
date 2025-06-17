return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'

    telescope.setup {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        winblend = 0,
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
    }

    local map = vim.keymap.set

    map('n', '<leader><leader>', builtin.find_files, { desc = '[F]ind files' })
    map('n', '<leader>sh', builtin.git_commits, { desc = '[S]earch [H]istory' })
    map('n', '<leader>sb', builtin.git_branches, { desc = '[S]earch [B]ranches' })
    map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    map('n', '<leader>sc', builtin.colorscheme, { desc = '[S]earch [C]olorschemes' })
    map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files' })
    map('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim config' })

    -- LSP
    map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics (doc)' })
    map('n', '<leader>sdw', function()
      builtin.diagnostics { severity_limit = 'WARN' }
    end, { desc = '[S]earch [D]iagnostics in [W]orkspace' })
    map('n', '<leader>ss', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
    map('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
    map('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
    map('n', 'gI', builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
    map('n', '<leader>D', builtin.lsp_type_definitions, { desc = 'Type [D]efinition' })
    map('n', '<leader>ws', builtin.lsp_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
    map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
  end,
}
