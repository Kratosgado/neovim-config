return {
  -- 1. Prevent Mason from auto-installing the unwanted tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Filter out the ones you don't want
      local ignore = { "kotlin-language-server", "ktlint" }
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return not vim.tbl_contains(ignore, tool)
      end, opts.ensure_installed)

      table.insert(opts.ensure_installed, "kotlin-lsp")
    end,
  },

  -- 2. Keep Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "kotlin" } },
  },

  -- 3. Explicitly disable the LSP in lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {
          enabled = false,
        },
      },
    },
  },

  -- 4. Disable ktlint in nvim-lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        kotlin = {},
      },
    },
  },

  -- 5. Disable ktlint in conform.nvim
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        kotlin = {},
      },
    },
  },

  -- 6. Your existing Debug Adapter (DAP) configuration
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = "mason-org/mason.nvim",
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
          mainClass = function()
            local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
            local fname = vim.api.nvim_buf_get_name(0)
            return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
          end,
          projectRoot = "${workspaceFolder}",
          jsonLogFile = "",
          enableJsonLogging = false,
        },
        {
          type = "kotlin",
          request = "attach",
          name = "Attach to debugging session",
          port = 5005,
          args = {},
          projectRoot = vim.fn.getcwd,
          hostName = "localhost",
          timeout = 2000,
        },
      }
    end,
  },
}
