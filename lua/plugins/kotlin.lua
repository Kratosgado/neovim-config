return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "ktlint" } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "kotlin" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {},
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    dependencies = "williamboman/mason.nvim",
    opts = {
      linters_by_ft = { kotlin = { "ktlint" } },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = "williamboman/mason.nvim",
    opts = function()
      local dap = require("dap")
      if not dap.adapters.kotlin then
        dap.adapters.kotlin = {
          type = "executable",
          command = "kotlin-debug-adapter",
          options = { auto_continue_if_many_stopped = false },
        }
      end

      dap.configurations.kotlin = {
        {
          type = "kotlin",
          request = "launch",
          name = "This file",
          mainClass = "${file}",
          projectRoot = "${workspaceFolder}",
          jsonLogFile = "${workspaceFolder}/.debug/kotlin-language-server.log",
        },
        {
          type = "kotlin",
          request = "launch",
          name = "Gradle",
          mainClass = "org.gradle.wrapper.GradleWrapperMain",
          projectRoot = "${workspaceFolder}",
          jsonLogFile = "${workspaceFolder}/.debug/kotlin-language-server.log",
        },
        {
          type = "kotlin",
          request = "attach",
          name = "Attach to debugging session",
          port = 5005,
          args = {},
          projectRoot = vim.fn.gecwd(),
          hostname = "localhost",
          timeout = 2000,
        },
      }
    end,
  },
}
