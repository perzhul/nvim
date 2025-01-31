return {
  'sindrets/diffview.nvim',
  config = function()
    vim.keymap.set('n', ',hh', '<cmd>DiffviewFileHistory<cr>', { desc = 'Repo history' }) -- trace history of repo
    vim.keymap.set('n', ',hf', '<cmd>DiffviewFileHistory --follow %<cr>', { desc = 'File history' }) -- trace history of current file
    vim.keymap.set('v', ',hl', "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = 'Range history' }) -- trace history under visual selection
    vim.keymap.set('n', ',hl', '<Cmd>.DiffviewFileHistory --follow<CR>', { desc = 'Line history' }) -- trace history of single line

    -- diff against HEAD
    vim.keymap.set('n', ',d', '<cmd>DiffviewOpen<cr>', { desc = 'Repo diff' })
    -- Highlight changed words.
    vim.keymap.set('n', ',vw', require('gitsigns').toggle_word_diff, { desc = 'Toggle word diff' })
    -- Highlight added lines.
    vim.keymap.set('n', ',vL', require('gitsigns').toggle_linehl, { desc = 'Toggle line highlight' })
    -- Highlight removed lines.
    vim.keymap.set('n', ',vv', require('gitsigns').preview_hunk_inline, { desc = 'Toggle deleted (all)' })
    vim.keymap.set('n', ',vh', require('gitsigns').preview_hunk, { desc = 'Preview hunk' })
  end,
}
