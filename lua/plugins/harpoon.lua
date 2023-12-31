return {
  { "nvim-lua/plenary.nvim" },
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
      },
      {
        "<leader>hh",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
      },
      {
        "<leader>h1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
      },
      {
        "<leader>h2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
      },
      {
        "<leader>h3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
      },
      {
        "<leader>h4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
      },
      {
        "<leader>h5",
        function()
          require("harpoon.ui").nav_file(5)
        end,
      },
    },
  },
}
