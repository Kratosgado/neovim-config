return {
  {
    "brianhuster/live-preview.nvim",
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
