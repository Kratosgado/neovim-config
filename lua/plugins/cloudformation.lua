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
              -- Explicitly define all layouts for Base64 to handle scripts and variables
              "!Base64",
              "!Base64 scalar",
              "!Base64 mapping",
              "!Base64 sequence",

              -- Apply the same robust declaration to other flexible AWS tags
              "!Sub",
              "!Sub scalar",
              "!Sub mapping",
              "!Sub sequence",
              "!GetAtt",
              "!GetAtt scalar",
              "!GetAtt mapping",
              "!GetAtt sequence",
              "!Ref",
              "!Ref scalar",

              -- Standard single-layout types
              "!And sequence",
              "!Cidr",
              "!Equals sequence",
              "!FindInMap sequence",
              "!GetAZs",
              "!If sequence",
              "!ImportValue scalar",
              "!Join sequence",
              "!Not sequence",
              "!Or sequence",
              "!Select sequence",
              "!Split sequence",
            },
          },
        },
      })
    end,
  },
}
