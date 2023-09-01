-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

function ExecuteBashInSplit()
  vim.cmd("vsp | term bash %")
end

function ExecuteBashSelection()
  vim.cmd("v,.!bash | vsp")
end

map({ "n" }, "<leader>be", ExecuteBashInSplit)
map({ "v" }, "<leader>bo", ExecuteBashSelection)

local vimscript_block = [[
  imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]]
vim.api.nvim_exec(vimscript_block, false)
