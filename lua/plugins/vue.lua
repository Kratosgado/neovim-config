local util = require("lspconfig.util")

local function is_vue_project(fname)
  return util.root_pattern("nuxt.config.ts", "nuxt.config.js", "nuxt.config.mts", "vue.config.ts", "vue.config.js")(
    fname
  )
end
local function is_frontend_project(fname)
  return util.root_pattern(
    -- Vue / Nuxt
    "nuxt.config.ts",
    "nuxt.config.js",
    "nuxt.config.mts",
    "vue.config.ts",
    "vue.config.js",
    -- React / Next
    "next.config.ts",
    "next.config.js",
    "next.config.mjs",
    -- Svelte
    "svelte.config.js",
    "svelte.config.ts",
    -- Astro
    "astro.config.ts",
    "astro.config.js",
    "astro.config.mjs",
    -- Generic signal — tailwind config itself
    "tailwind.config.ts",
    "tailwind.config.js",
    "tailwind.config.mjs"
  )(fname)
end
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
              hybridMode = true,
            },
          },
        },
        vue_ls = false,
        tailwindcss = {
          root_dir = function(fname)
            return is_frontend_project(fname)
          end,
        },
        vtsls = {
          enabled = function()
            local root = vim.loop.cwd()
            return vim.loop.fs_stat(root .. "/nuxt.config.ts") ~= nil
              or vim.loop.fs_stat(root .. "/nuxt.config.js") ~= nil
              or vim.loop.fs_stat(root .. "/vue.config.ts") ~= nil
          end,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if opts.servers.vtsls then
        table.insert(opts.servers.vtsls.filetypes, "vue")
        LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
          {
            name = "@vue/typescript-plugin",
            location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        })
      else
        vim.g.lazyvim_ts_lsp = "tsgo"
      end
    end,
  },
}
