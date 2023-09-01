local is_deno = function()
  local dir = vim.fn.expand("%:p:h")

  if dir:find("/grow/examples/external") then
    return false
  end

  if dir:find("nexus/node") then
    return false
  end

  if dir:find("nexus") then
    return true
  end

  if dir:find("back") then
    return true
  end

  if dir:find("contract") then
    return true
  end

  if dir:find("grow") then
    return true
  end

  if dir:find("plantolog") then
    return true
  end

  return false
end
local util = require("lspconfig.util")

local deno_root = util.root_pattern("deno.json", "deno.jsonc")
local node_root = util.root_pattern("package.json")

function Stop_denols()
  local active_clients = vim.lsp.get_active_clients()
  for _, client in pairs(active_clients) do
    -- stop tsserver if denols is already active
    if client.name == "denols" then
      client.stop()
    end
  end
end

function Stop_tsserver()
  local active_clients = vim.lsp.get_active_clients()
  for _, client in pairs(active_clients) do
    -- stop tsserver if denols is already active
    if client.name == "tsserver" then
      client.stop()
    end
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          root_dir = function(dir)
            if not is_deno() then
              return node_root(dir)
            end
          end,
          single_file_support = false,
        },
        denols = {
          root_dir = function(dir)
            if is_deno() then
              return deno_root(dir)
            end
          end,
          single_file_support = false,
        },
      },
    },
  },
}

-- prevent tsserver and denols competeing
-- local active_clients = vim.lsp.get_active_clients()
-- if client.name == "denols" then
-- 	for _, client_ in pairs(active_clients) do
-- 		-- stop tsserver if denols is already active
-- 		if client_.name == "tsserver" then
-- 			client_.stop()
-- 		end
-- 	end
-- elseif client.name == "tsserver" then
-- 	for _, client_ in pairs(active_clients) do
-- 		-- prevent tsserver from starting if denols is already active
-- 		if client_.name == "denols" then
-- 			client.stop()
-- 		end
-- 	end
-- end

--   "neovim/nvim-lspconfig",
--   setup = function()
--     require("lspconfig").denols.setup({
--       root_dir = root_pattern("deno.json", "deno.jsonc", ".git"),
--     })
--   end,
-- },
--   {
--     "sigmasd/deno-nvim",
--   },
-- }
-- {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     "jose-elias-alvarez/typescript.nvim",
--     init = function()
--       require("lazyvim.util").on_attach(function(_, buffer)
--         -- stylua: ignore
--         vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
--         vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
--       end)
--     end,
--   },
--   ---@class PluginLspOpts
--   opts = {
--     ---@type lspconfig.options
--     servers = {
--       -- tsserver will be automatically installed with mason and loaded with lspconfig
--       tsserver = {},
--     },
--     -- you can do any additional lsp server setup here
--     -- return true if you don't want this server to be setup with lspconfig
--     ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
--     setup = {
--       -- example to setup with typescript.nvim
--       tsserver = function(_, opts)
--         require("typescript").setup({ server = opts })
--         return true
--       end,
--       -- Specify * to use this function as a fallback for any server
--       -- ["*"] = function(server, opts) end,
--     },
--   },
-- {
--   "sigmasd/deno-nvim",
--   opts = {
--     root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc", "denonvim.tag"),
--   },
-- },
