-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.background = "dark"
vim.o.winbar = "%=%m %f"
vim.opt.compatible = false
vim.o.wrap = true
vim.o.linebreak = true
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
-- vim.g.vimwiki_list = {
--   { path = "~/vimwiki/", syntax = "markdown", ext = ".md" },
-- }
