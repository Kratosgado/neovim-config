return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vue", "css" } },
  },
  {

    "mason-org/mason.nvim",
    opts = { ensure_installed = { "vue-language-server" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        },
        vue_ls = false,
        -- vtsls = {},
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     -- Initialize the table if it doesn't exist to prevent the 'got nil' error
  --     opts.servers.vtsls.filetypes = opts.servers.vtsls.filetypes or {}
  --     table.insert(opts.servers.vtsls.filetypes, "vue")
  --
  --     LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
  --       {
  --         name = "@vue/typescript-plugin",
  --         location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
  --         languages = { "vue" },
  --         configNamespace = "typescript",
  --         enableForWorkspaceTypeScriptVersions = true,
  --       },
  --     })
  --   end,
  -- },
}
