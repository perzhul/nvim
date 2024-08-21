return {
  -- 'github/copilot.vim',
  'eandrju/cellular-automaton.nvim',
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },
  'ThePrimeagen/vim-be-good',
  { 'artemave/workspace-diagnostics.nvim' },
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    config = function()
      require('render-markdown').setup {}
    end,
  },
  'artemave/workspace-diagnostics.nvim',
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {
      hint_prefix = '💅 ',
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
  {
    'saecki/live-rename.nvim',
    config = function() end,
  },
  'workspace-diagnostics.nvim',
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings
  { -- optional completion source for require statements and module annotations
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = 'lazydev',
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'modus-vivendi',
        },
      }
    end,
  },
  {
    'gbprod/substitute.nvim',
    config = function()
      local substitute = require 'substitute'

      substitute.setup()

      vim.keymap.set('n', 's', substitute.operator, { desc = 'Substitute with motion' })
      vim.keymap.set('n', 'ss', substitute.line, { desc = 'Substitute line' })
      vim.keymap.set('n', 'S', substitute.eol, { desc = 'Substitute to end of line' })
      vim.keymap.set('x', 's', substitute.visual, { desc = 'Substitute in visual mode' })
    end,
  },
}
