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
          use_as_default_explorer = true,
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
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
      {
        "<leader>fm",
        function()
          require("mini.files").open(LazyVim.root(), true)
        end,
        desc = "Open mini.files (root)",
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
