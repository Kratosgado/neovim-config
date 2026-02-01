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
        order = { " ", "~", "!", ">", "x" },
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
      ui = {
        enable = true, -- set to false to disable all UI features
        update_debounce = 200,
        -- Define how various check-boxes are displayed
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "󰭒", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          ["!"] = { char = "", hl_group = "ObsidianImportant" },
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        -- Reference ahead-of-time (relative to current directory)
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        block_ids = { hl_group = "ObsidianBlockID" },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = "#f78c6c" },
          ObsidianDone = { bold = true, fg = "#89ddff" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianTilde = { bold = true, fg = "#ff5370" },
          ObsidianImportant = { bold = true, fg = "#d73128" },
          ObsidianBullet = { bold = true, fg = "#89ddff" },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
          ObsidianBlockID = { italic = true, fg = "#89ddff" },
        },
      },
    },
    keys = {
      { "<leader>oo", ":Obsidian<CR>", desc = "Open Obsidian Vault" },
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
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "Jarvismkennedy/git-auto-sync.nvim",
    opts = {
      {
        "~/vaults",
        auto_pull = false,
        auto_push = false,
        auto_commit = false,
        prompt = true,
        name = "vaults",
      },
    },
    lazy = false,
  },
}
