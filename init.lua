vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'options'

require 'keymaps'

require 'lazy-bootstrap'

require 'lazy-plugins'

require 'autocmd'

-- Colorscheme
-- local hour = tonumber(os.date('%H', os.time()))
--
-- if hour > 6 and hour < 21 then
--   vim.cmd [[colorscheme github_light]]
--   return
-- end

vim.cmd [[colorscheme zenbones]]
vim.cmd [[set background=light]]
