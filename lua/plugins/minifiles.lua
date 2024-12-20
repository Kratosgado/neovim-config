return {
  {
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("mini.files").setup({
        windows = {
          preview = true,
          width_focus = 30, -- Width of the focused window
          width_preview = 80,
        },
        options = {
          use_as_default_explorer = false,
        },
        mappings = {
          close = ";;", -- Close file explorer
          open = "<CR>", -- Open file
        },
      })
      -- Keymap to open mini.files
      vim.keymap.set("n", "<leader>e", function()
        require("mini.files").open(vim.fn.getcwd())
      end, { desc = "Open Mini Files" })
    end,
  },
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    keys = {
      {
        "<leader>go",
        function()
          require("mini.diff").toggle_overlay(0)
        end,
        desc = "Toggle mini.diff overlay",
      },
    },
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "▎",
          change = "▎",
          delete = "",
        },
      },
    },
  },
}
