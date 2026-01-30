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
  },
  {
    "Jarvismkennedy/git-auto-sync.nvim",
    opts = {
      {
        "~/vaults",
        auto_pull = false,
        auto_push = false,
        auto_commit = true,
        prompt = true,
        name = "vaults",
      },
    },
    lazy = false,
  },
}
