return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = function()
    local utils = require 'core.utils'
    local git_blame = require 'gitblame'
    -- This disables showing of the blame text next to the cursor
    vim.g.gitblame_display_virtual_text = 0

    return {
      options = {
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = ' ' },
        theme = 'cyberdream',
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
      },
      sections = {
        lualine_a = {
          { 'branch', icon = '' },
        },
        lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
        lualine_b = {
          { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
          {
            'filename',
            padding = { left = 1, right = 0 },
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 1, -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = '[+]', -- Text to show when the file is modified.
              readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]', -- Text to show for newly created file before first write
            },
          },
        },
        lualine_x = {
          {
            'diagnostics',
            always_visible = false,
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = '󰝶 ',
            },
          },
          { 'diff' },
        },
        lualine_y = {
          {
            'progress',
          },
          {
            'location',
            color = utils.get_hlgroup 'Boolean',
          },
        },
        lualine_z = {},
      },
      extensions = { 'lazy', 'toggleterm', 'mason', 'neo-tree', 'trouble' },
    }
  end,
}
