local hour = tonumber(os.date('%H', os.time()))

if hour > 6 and hour < 21 then
  vim.cmd [[colorscheme github_light]]
  return
end

vim.cmd [[colorscheme github_dark_dimmed]]
