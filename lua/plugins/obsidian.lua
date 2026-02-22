return {

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    dependencies = {
      "MeanderingProgrammer/render-markdown.nvim",
      "obsidian-nvim/obsidian-markmap.nvim",
      "obsidian-nvim/calendar.nvim",
    },
    ft = "markdown",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
      checkbox = {
        enabled = true,
        create_new = true,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
      },
      ui = { enable = false },
    },
    keys = {
      { "<leader>oo", ":Obsidian<CR>", desc = "Open Obsidian Vault" },
      { "<leader>ov", ":Obsidian open<CR>", desc = "View in Obsidian" },
      { "<leader>os", ":Obsidian quick_switch<CR>", desc = "Open Quick Switch Vault" },
      { "<leader>od", ":Obsidian dailies<CR>", desc = "Open Dailies Vault" },
      { "<leader>ow", ":Obsidian weekly<CR>", desc = "Open Weekly Vault" },
      { "<leader>om", ":Obsidian monthly<CR>", desc = "Open Monthly Vault" },
      { "<leader>oy", ":Obsidian yearly<CR>", desc = "Open Yearly Vault" },
    },
  },
  {
    "basola21/PDFview",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>op", "<cmd>lua require('pdfview').open()<CR>", desc = "PDFview: Open PDF" },
      { "<leader>jj", "<cmd>:lua require('pdfview.renderer').next_page()<CR>", desc = "PDFview: Next page" },
      { "<leader>kk", "<cmd>:lua require('pdfview.renderer').previous_page()<CR>", desc = "PDFview: Previous page" },
    },
  },
}
