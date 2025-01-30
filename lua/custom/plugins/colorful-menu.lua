return {
  'xzbdmw/colorful-menu.nvim',
  config = function()
    -- You don't need to set these options.
    require('colorful-menu').setup {
      ls = {
        lua_ls = {
          -- Maybe you want to dim arguments a bit.
          arguments_hl = '@comment',
        },
        gopls = {},
        ts_ls = {
          extra_info_hl = '@comment',
        },
        -- If true, try to highlight "not supported" languages.
        fallback = true,
      },
      -- If the built-in logic fails to find a suitable highlight group,
      -- this highlight is applied to the label.
      fallback_highlight = '@variable',
      -- If provided, the plugin truncates the final displayed text to
      -- this width (measured in display cells). Any highlights that extend
      -- beyond the truncation point are ignored. When set to a float
      -- between 0 and 1, it'll be treated as percentage of the width of
      -- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
      -- Default 60.
      max_width = 60,
    }
  end,
}
