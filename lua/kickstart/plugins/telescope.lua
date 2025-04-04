return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      { 'isak102/telescope-git-file-history.nvim', dependencies = { 'tpope/vim-fugitive' } },
    },

    config = function()
      local gfh_actions = require('telescope').extensions.git_file_history.actions

      local actions = require 'telescope.actions'

      require('telescope').setup {
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        defaults = {
          path_display = { 'smart' },
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result
              ['<C-j>'] = actions.move_selection_next, -- move to next result
            },
          },
        },
        extensions = {
          smart_open = {
            cwd_only = true,
            filename_first = true,
            ignore_patterns = {
              '*.temp/*',
              'index.ts',
              'ns.ts',
            },
            match_algorithm = 'fzf',
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          git_file_history = {
            -- Keymaps inside the picker
            mappings = {
              i = {
                ['<C-g>'] = gfh_actions.open_in_browser,
              },
              n = {
                ['<C-g>'] = gfh_actions.open_in_browser,
              },
            },
            browser_command = nil,
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'git_file_history')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      local map = vim.keymap.set

      map('n', '<leader><leader>', function()
        require('telescope').extensions.smart_open.smart_open()
      end, { noremap = true, silent = true })
      map('n', '<leader>sgh', '<cmd>Telescope git_file_history<CR>', { desc = '[S]earch [G]it [H]istory' })
      map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      map('n', '<leader>sc', builtin.colorscheme)
      map('n', '<leader>sd', function()
        require('telescope.builtin').diagnostics { severity_bound = 0 }
      end, { desc = '[S]earch [D]iagnostics' })
      map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })

      map('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
