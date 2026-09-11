return {
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
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = { exclude = { "kotlin_lsp" } },
    },
  },

  {
    "AlexandrosAlexiou/kotlin.nvim",
    ft = "kotlin",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "stevearc/oil.nvim",
      "folke/trouble.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      jdk_for_symbol_resolution = "/home/esslifie/.sdkman/candidates/java/21.0.9-amzn",
      jvm_args = { "-Xmx4g" },
      inlay_hints = { enabled = true },
    },
    config = function(_, opts)
      require("kotlin").setup(opts)
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
    ft = { "kotlin", "java" },
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
      diagnostics = { enabled = true },
    },
    config = function(_, opts)
      require("ktor").setup(opts)
      require("ktor.index").refresh()
    end,
    keys = {
      { "<leader>kt", "<cmd>KtorRouteTree<cr>", ft = "kotlin", desc = "Ktor: Route Tree" },
      { "<leader>kl", "<cmd>KtorCodeLensToggle<cr>", ft = "kotlin", desc = "Ktor: Toggle Code Lens" },
      { "<leader>ke", "<cmd>KtorEndpoints<cr>", ft = "kotlin", desc = "Ktor: Endpoints" },
      { "<leader>kg", "<cmd>KtorGenerateRequest<cr>", ft = "kotlin", desc = "Ktor: Generate Request" },
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
