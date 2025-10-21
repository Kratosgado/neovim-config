return {
  -- "nvim-neo-tree/neo-tree.nvim",
  -- opts = {
  --   window = {
  --     position = "right", -- set Neo-tree to the right
  --   },
  -- },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
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
