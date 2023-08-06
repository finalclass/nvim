return {
  {
    "neovim/nvim-lspconfig",
    setup = function()
      require("lspconfig").denols.setup({
        root_dir = root_pattern("deno.json", "deno.jsonc", ".git"),
      })
    end,
  },
  --   {
  --     "sigmasd/deno-nvim",
  --   },
}
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
