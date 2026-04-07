return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vue", "css" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "vue-language-server", "vtsls" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local util = require("lspconfig.util")

      local function is_vue_project(fname)
        return util.root_pattern(
          "nuxt.config.ts",
          "nuxt.config.js",
          "nuxt.config.mts",
          "vue.config.ts",
          "vue.config.js"
        )(fname)
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

      -- Volar for .vue files
      opts.servers.volar = {
        init_options = {
          vue = { hybridMode = true },
        },
      }
      opts.servers.tailwindcss = {
        root_dir = function(fname)
          if not is_frontend_project(fname) then
            return nil
          end
          return util.root_pattern("tailwind.config.ts", "tailwind.config.js", "tailwind.config.mjs", "package.json")(
            fname
          )
        end,
      }
      -- vtsls with vue plugin, only in vue/nuxt projects
      opts.servers.vtsls = {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        root_dir = function(fname)
          return is_vue_project(fname)
        end,
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
                  languages = { "vue" },
                  configNamespace = "typescript",
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
        },
      }

      -- disable tsgo in vue/nuxt projects
      opts.servers.tsgo = {
        root_dir = function(fname)
          if is_vue_project(fname) then
            return nil
          end
          return util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
        end,
      }
    end,
  },
}
