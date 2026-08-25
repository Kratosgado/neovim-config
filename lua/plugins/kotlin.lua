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

  {
    dir = "~/projects/configs/ktor.nvim",
    name = "ktor.nvim",
    ft = "kotlin",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      route_tree = {
        display = "split", -- "float" | "split"
        width = 60,
        split_side = "right",
      },
    },
    config = function(_, opts)
      require("ktor").setup(opts)
      require("ktor.index").refresh()
    end,
    keys = {
      { "<leader>kt", "<cmd>KtorRouteTree<cr>", ft = "kotlin", desc = "Ktor: Route Tree" },
      { "<leader>kl", "<cmd>KtorCodeLensToggle<cr>", ft = "kotlin", desc = "Ktor: Toggle Code Lens" },
      { "<leader>ke", "<cmd>KtorEndpoints<cr>", ft = "kotlin", desc = "Ktor: Endpoints" },
      { "<leader>kr", "<cmd>KtorRefresh<cr>", ft = "kotlin", desc = "Ktor: Refresh Index" },
    },
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
