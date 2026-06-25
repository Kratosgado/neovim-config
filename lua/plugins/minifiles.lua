return {
  {
    "nvim-mini/mini.files",
    version = false,
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(LazyVim.root(), true)
        end,
        desc = "Open mini.files (root)",
      },
    },
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
          close = "jk", -- Close file explorer
          open = "<CR>", -- Open file
        },
      })
    end,
  },
  {
    "nvim-mini/mini.diff",
    event = "VeryLazy",
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "+",
          change = "~",
          delete = "",
        },
      },
    },
  },
}
