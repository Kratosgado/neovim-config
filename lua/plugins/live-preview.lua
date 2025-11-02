return {
  {
    "brianhuster/live-preview.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      require("livepreview.config").set({
        port = 3000,
      })
    end,
  },
}
