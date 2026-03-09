return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    opts = {
      disable_diagnostics = false,
      default_mappings = {
        ours = "o",
        theirs = "t",
        none = "0",
        both = "b",
        next = "n",
        prev = "p",
      },
    },
    config = true,
  },
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    opts = {
      enabled = true, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
      set_extmark_options = {
        priority = 7,
      },
    },
  },

  {
    "Jarvismkennedy/git-auto-sync.nvim",
    opts = {
      {
        "~/vaults",
        auto_pull = true,
        auto_push = true,
        auto_commit = true,
        prompt = false,
        name = "vaults",
      },
      {
        "~/.config/nvim",
        auto_pull = true,
        auto_push = true,
        auto_commit = true,
        prompt = false,
        name = "vaults",
      },
    },
    lazy = false,
  },
}
