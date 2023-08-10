return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewLog" },
    keys = {
      {
        "gl",
        mode = { "v", "n" },
        function()
          local start_line = vim.fn.line("v")
          local end_line = vim.fn.line(".")

          local result = vim.fn.system("gitea-link " .. vim.fn.expand("%:p") .. " " .. start_line .. " " .. end_line)
          print(result)
        end,
        -- ":silent ! gitea-link %:p " .. get_current_line_number() .. " <cr>",
        desc = "Get link to gitea repo",
      },
      {
        "<leader>dvv",
        function()
          vim.cmd("DiffviewOpen reviewed")
        end,
      },
      {
        "<leader>dvq",
        function()
          vim.cmd("DiffviewClose")
        end,
      },
    },
  },
}
