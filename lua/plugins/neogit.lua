return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
    'echasnovski/mini.pick', -- optional
    'folke/snacks.nvim', -- optional
  },
  config = function()
    -- Neogit main status view
    vim.keymap.set('n', '<leader>gs', ':Neogit<CR>', { desc = 'Neogit Status' })

    -- Neogit with custom working directory (useful for monorepos or nested projects)
    vim.keymap.set('n', '<leader>gS', ':Neogit cwd=<cwd><CR>', { desc = 'Neogit Status (Custom Directory)' })
    vim.keymap.set('n', '<leader>g.', ':Neogit cwd=%:p:h<CR>', { desc = 'Neogit Status (Current File Directory)' })

    -- Neogit commit popup
    vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { desc = 'Neogit Commit' })

    -- Neogit specific popups (e.g., push, pull, log)
    vim.keymap.set('n', '<leader>gp', ':Neogit kind=push<CR>', { desc = 'Neogit Push' })
    vim.keymap.set('n', '<leader>gl', ':Neogit kind=log<CR>', { desc = 'Neogit Log' })
    vim.keymap.set('n', '<leader>gf', ':Neogit kind=fetch<CR>', { desc = 'Neogit Fetch' })
    vim.keymap.set('n', '<leader>gr', ':Neogit kind=rebase<CR>', { desc = 'Neogit Rebase' })
    vim.keymap.set('n', '<leader>gm', ':Neogit kind=merge<CR>', { desc = 'Neogit Merge' })
  end,
}
