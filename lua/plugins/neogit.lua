return {
  {
    "NeogitOrg/neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    opts = {
      popup = { kind = "floating" },
      integrations = { fzf_lua = true },
      commit_editor = { kind = "floating" },
      commit_select_view = { kind = "floating" },
      commit_view = { kind = "floating" },
      log_view = { kind = "floating" },
      description_editor = { kind = "floating" },
      reflog_view = { kind = "floating" },
      tag_editor = { kind = "floating" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      "ibhagwan/fzf-lua",
    },
  },
  -- {
  --   "sindrets/diffview.nvim",
  --
  --   -- keys = {
  --   --   { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff" },
  --   --   { "<leader>gs", "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
  --   --   { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close diff" },
  --   -- },
  -- }
}
