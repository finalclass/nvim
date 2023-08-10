local is_deno = function()
  local dir = vim.fn.expand("%:p:h")

  if dir:find("/grow/examples/external") then
    return false
  end

  return dir:find("/back") ~= nil or dir:find("/contract") ~= nil or dir:find("/grow")
end
local Util = require("lspconfig.util")

local deno_root = Util.root_pattern("deno.json", "deno.jsonc")
local node_root = Util.root_pattern("package.json")

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
