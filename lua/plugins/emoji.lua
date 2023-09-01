return {
  { "stevearc/dressing.nvim" },
  {
    "ziontee113/icon-picker.nvim",
    opts = function()
      require("icon-picker").setup({
        disable_legacy_commands = true,
      })
    end,
    keys = {
      {
        "<leader>ie",
        "<cmd>IconPickerNormal<cr>",
      },
    },
  },
}
