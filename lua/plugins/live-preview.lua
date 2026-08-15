return {
  {
    "brianhuster/live-preview.nvim",
    event = "VeryLazy",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = function()
      require("livepreview.config").set({
        port = 3000,
      })
    end,
  },
}
