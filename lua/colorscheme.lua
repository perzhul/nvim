local time = os.date '*t'
if time.hour < 8 or time.hour >= 19 then
  vim.g.tokyonight_style = 'night'
  vim.cmd [[colorscheme github_dark]]
else
  vim.cmd [[colorscheme github_light]]
end
