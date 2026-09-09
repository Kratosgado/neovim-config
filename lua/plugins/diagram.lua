return {
  {
    "3rd/image.nvim",
    opts = {},
  },
  {
    "3rd/diagram.nvim",
    dependencies = { "3rd/image.nvim" },
    ft = { "markdown", "norg" },
    opts = {
      renderer_options = {
        mermaid = {
          background = "transparent",
          theme = "dark",
          scale = 3,
        },
      },
    },
    keys = {
      {
        "<leader>Md",
        function()
          require("diagram").show_diagram_hover()
        end,
        mode = "n",
        ft = { "markdown", "norg" },
        desc = "Show diagram (hover)",
      },
    },
  },

  -- which-key group label for the diagram prefix
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>M", group = "diagram", icon = "󰙨" },
      },
    },
  },
}
