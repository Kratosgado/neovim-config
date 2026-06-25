return {
  -- Automated JSON/YAML schemas
  {
    "b0o/SchemaStore.nvim",
    version = false, -- Highly recommended to use latest
  },
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/SchemaStore.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            schemaStore = {
              -- Disable built-in store to use the SchemaStore plugin instead
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas({
              -- Automatically selects AWS CloudFormation for matching files
              select = {
                "AWS CloudFormation",
                "AWS CloudFormation Serverless Application Model (SAM)",
              },
            }),
            -- CRITICAL: Allows Neovim to accept custom AWS YAML tags without errors
            customTags = {
              "!And sequence",
              "!Base64",
              "!Cidr",
              "!Equals sequence",
              "!FindInMap sequence",
              "!GetAZs",
              "!GetAtt",
              "!GetAtt scalar",
              "!If sequence",
              "!ImportValue",
              "!Join sequence",
              "!Not sequence",
              "!Or sequence",
              "!Ref",
              "!Select sequence",
              "!Split sequence",
              "!Sub",
              "!Sub sequence",
              "!Transform",
            },
          },
        },
      })
    end,
  },
}
