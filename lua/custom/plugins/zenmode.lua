return {
  'folke/zen-mode.nvim',
  config = function()
    require('zen-mode').setup {}

    local function toggle_zen_mode(width, show_numbers, color_column)
      require('zen-mode').setup {
        window = {
          width = width,
          options = {},
        },
      }
      require('zen-mode').toggle()

      vim.wo.wrap = false
      vim.wo.number = show_numbers
      vim.wo.rnu = show_numbers
      vim.opt.colorcolumn = color_column or '0'
    end

    vim.keymap.set('n', '<leader>zz', function()
      toggle_zen_mode(90, true)
    end)

    vim.keymap.set('n', '<leader>zZ', function()
      toggle_zen_mode(80, false, '0')
    end)
  end,
}
