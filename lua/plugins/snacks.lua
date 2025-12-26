return {
  {
    "folke/snacks.nvim",
    ---@class snacks.Config
    opts = {
      bigfile = { enabled = true },
      image = { enabled = true },
      -- explorer = { enabled = false },
      quickfile = { enabled = true },
      picker = {
        enabled = false,
        sources = {
          explorer = {
            layout = {
              layout = {
                position = "right",
              },
            },
          },
        },
      },
    },
  },
}
