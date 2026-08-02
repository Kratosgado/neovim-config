return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
  },
  {
    "oclay1st/gradle.nvim",
    cmd = { "Gradle", "GradleExec", "GradleInit", "GradleFavorites" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {}, -- options, see default configuration
    keys = {
      { "<leader>G", desc = "+Gradle", mode = { "n", "v" } },
      { "<leader>Gg", "<cmd>Gradle<cr>", desc = "Gradle Projects" },
      { "<leader>Gf", "<cmd>GradleFavorites<cr>", desc = "Gradle Favorite Commands" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      -- Simple configuration to attach to remote java debug process
      -- Taken directly from https://github.com/mfussenegger/nvim-dap/wiki/Java
      local dap = require("dap")
      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcasia/neotest-java",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-java"] = {},
      },
    },
  },
  {
    dir = "~/projects/configs/liquibase.nvim",
    name = "liquibase.nvim",
    config = function()
      require("liquibase").setup()
    end,
  },
  {
    dir = "~/projects/configs/graphql-resolver.nvim",
    -- "kratosgado/graphql-resolver.nvim",
    name = "graphql-resolver.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      keymaps = {
        goto_definition = "gR", -- e.g. "gR"
      },
    },
  },
}
