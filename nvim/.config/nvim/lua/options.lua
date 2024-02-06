-- enable true color
vim.opt.termguicolors = true

-- line number
vim.opt.number = true
-- vim.opt.relativenumber = true

-- reduce update time for immediate git status (airblade/vim-gitgutter)
vim.opt.updatetime = 100

-- set colorscheme
vim.cmd("colorscheme codedark")

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- indentation settings
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- display hidden characters
-- use :set list or :set nolist
-- vim.opt.list = true
vim.opt.listchars = {
  tab = ">·",
  trail = "·",
  -- precedes = "←",
  -- extends = "→",
  -- eol = "↲",
  nbsp = "␣",
  space = "·",
}
