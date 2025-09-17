return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    opts = {
      breadcrumbs_separator = "/",
      has_breadcrumbs = true,
      has_line_number = false,
      mac_window_bar = true,
      save_path = "~/Pictures/codesnaps/",
      bg_theme = "grape",
      title = "CodeSnap.nvim",
      watermark = "Kratosgado",
    },
  },
}
