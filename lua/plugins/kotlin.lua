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
    opts = { ensure_installed = { "kotlin", "sql" } },
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

  -- 5b. Disable ktlint in null-ls too (LazyVim's lang.kotlin extra adds it
  -- via an opts *function*, so a plain-table override can't remove it --
  -- kotlin-lsp's own formatter is used instead).
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.tbl_filter(function(source)
        return source ~= nls.builtins.formatting.ktlint and source ~= nls.builtins.diagnostics.ktlint
      end, opts.sources or {})
    end,
  },

  -- lazy.nvim setup
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- ...
      "codymikol/neotest-kotlin",
    },
    opts = {
      adapters = {
        ["neotest-kotlin"] = {},
      },
    },
  },

  -- 6. springboot-jpql.nvim: JPA "language injection" for @Query strings in
  -- Spring Data repositories -- native queries get real SQL + sqls LSP via
  -- otter.nvim, JPQL queries get entity/field completion via blink.cmp.
  -- DB connection is read per-project from each project's own `.env`
  -- (DATABASE_URL / DATABASE_USERNAME / DATABASE_PASSWORD by default -- see
  -- README for how to point it at different env var names per project).
  --
  -- Deliberately `lazy = false` (loads unconditionally at startup), NOT
  -- `ft = "kotlin"` or an event trigger: nvim-treesitter's own highlight-attach
  -- plugin loads on `LazyFile`/`VeryLazy`, and it constructs (and PERMANENTLY
  -- caches on that buffer's parser object) the kotlin injections query at
  -- parser-creation time. If that happens before our custom
  -- #has-native-query? predicate is registered, the buffer is stuck using a
  -- stale query forever -- no amount of re-parsing fixes it, only loading
  -- before that first construction does. `LazyFile` fires on the very first
  -- buffer read (i.e. possibly before Neovim even finishes starting up, if a
  -- file is opened from the command line), so even `event = "VeryLazy"`
  -- isn't early enough to reliably win that race -- only loading eagerly,
  -- unconditionally, in the same "start plugins" phase nvim-treesitter's own
  -- lazy trigger hasn't even registered yet, is deterministic. setup() here
  -- is cheap (an LSP config registration, a treesitter predicate, a couple
  -- of autocmds, and an async-scheduled entity scan) so this costs nothing
  -- meaningful at startup.
  -- See ~/projects/configs/springboot-jpql.nvim/README.md
  {
    dir = "~/projects/configs/springboot-jpql.nvim",
    name = "springboot-jpql.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "jmbuhr/otter.nvim",
    },
    opts = {
      entities = {
        globs = { "src/main/kotlin/**/*.kt" },
      },
    },
    config = function(_, opts)
      require("springboot-jpql").setup(opts)
    end,
  },

  -- 6b. springboot-jpql.nvim depends on `sqls` for native-query completion.
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "sqls")
    end,
  },

  -- 7. Register the JPQL completion source with blink.cmp
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "springboot_jpql" },
        providers = {
          springboot_jpql = {
            name = "SpringbootJpql",
            module = "springboot-jpql.blink_source",
          },
        },
      },
    },
  },

  -- 8. Your existing Debug Adapter (DAP) configuration
  -- {
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   dependencies = "mason-org/mason.nvim",
  --   opts = function()
  --     local dap = require("dap")
  --     if not dap.adapters.kotlin then
  --       dap.adapters.kotlin = {
  --         type = "executable",
  --         command = "kotlin-debug-adapter",
  --         options = { auto_continue_if_many_stopped = false },
  --       }
  --     end
  --
  --     dap.configurations.kotlin = {
  --       {
  --         type = "kotlin",
  --         request = "launch",
  --         name = "This file",
  --         mainClass = function()
  --           local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
  --           local fname = vim.api.nvim_buf_get_name(0)
  --           return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
  --         end,
  --         projectRoot = "${workspaceFolder}",
  --         jsonLogFile = "",
  --         enableJsonLogging = false,
  --       },
  --       {
  --         type = "kotlin",
  --         request = "attach",
  --         name = "Attach to debugging session",
  --         port = 5005,
  --         args = {},
  --         projectRoot = vim.fn.getcwd,
  --         hostName = "localhost",
  --         timeout = 2000,
  --       },
  --     }
  --   end,
  -- },
}
