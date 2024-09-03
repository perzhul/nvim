return {
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  'artemave/workspace-diagnostics.nvim',
  'workspace-diagnostics.nvim',
  'eandrju/cellular-automaton.nvim',
  'ThePrimeagen/vim-be-good',
  'saecki/live-rename.nvim',
  'folke/drop.nvim',
  -- 'github/copilot.vim',
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '\\', vim.cmd.UndotreeToggle)
    end,
  },
}
