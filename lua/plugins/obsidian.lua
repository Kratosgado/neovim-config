return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ft = "markdown",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
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
    },
    keys = {
      { "<leader>oo", ":Obsidian<CR>", desc = "Open Obsidian Vault" },
      { "<leader>od", ":Obsidian dailies<CR>", desc = "Open Dailies Vault" },
    },
  },
  {
    "Jarvismkennedy/git-auto-sync.nvim",
    opts = {
      {
        "~/vaults",
        auto_pull = true,
        auto_push = true,
        auto_commit = false,
        prompt = true,
        name = "vaults",
      },
    },
    lazy = false,
  },
}
