return {
  {
    "mistricky/codesnap.nvim",
    tag = "v2.0.0",
    -- keys = {
    --   { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    --   { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    -- },
    opts = {
      snapshot_config = {
        code_donfig = {
          breadcrumbs = {
            enable = true,
            separator = "/",
            color = "#80848b",
            font_family = "ComicShannsMono Nerd Font",
          },
        },
      },
      show_line_number = false,
      -- save_path = "~/Pictures/codesnaps/",
      background = "#1e1f29",
      -- title = "CodeSnap.nvim",
      watermark = {
        content = "Kratosgado",
        font_family = "ComicShannsMono Nerd Font",
      },
    },
  },
}
