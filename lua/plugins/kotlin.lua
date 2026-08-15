return {
  -- Install kotlin-lsp and sqls via Mason (kotlin.nvim manages server lifecycle).
  -- kotlin_lsp is disabled in lspconfig so mason-lspconfig doesn't also start it.
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "kotlin-lsp")
      table.insert(opts.ensure_installed, "sqls")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "kotlin", "sql" } },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_lsp = { enabled = false },
        kotlin_language_server = { enabled = false },
      },
    },
  },

  -- kotlin.nvim manages kotlin-lsp's lifecycle; Mason only installs the binary.
  {
    "AlexandrosAlexiou/kotlin.nvim",
    ft = { "kotlin" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      { "stevearc/oil.nvim", optional = true },
      { "folke/trouble.nvim", optional = true },
    },
    config = function()
      require("kotlin").setup({
        jvm_args = { "-Xmx4g" },
      })
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "codymikol/neotest-kotlin",
    },
    opts = {
      adapters = {
        ["neotest-kotlin"] = {},
      },
    },
  },

  -- springboot-jpql.nvim: JPA "language injection" for @Query strings in
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
        globs = { "src/main/kotlin/**/*.kt", "src/main/java/**/*.java" },
      },
    },
    config = function(_, opts)
      require("springboot-jpql").setup(opts)
    end,
  },

  -- Register the JPQL completion source with blink.cmp
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
}
