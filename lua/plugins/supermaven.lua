return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    cmd = {
      "SupermavenUseFree",
    },
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-l>", -- handled by nvim-cmp / blink.cmp
        },
        log_level = "info",
        disable_inline_completion = false,
        disable_keymaps = false,
        ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
      })
      -- Apply immediately
      vim.api.nvim_set_hl(0, "SupermavenSuggestion", { fg = "#7aa2f7", italic = true })
      -- vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = "#7aa2f7", italic = true })
      vim.api.nvim_set_hl(0, "SupermavenKeyword", { fg = "#7aa2f7", italic = true })
    end,
  },
}
