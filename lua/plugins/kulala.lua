return {
  {
    "dont-be-evil-company/kulala.nvim",
    -- Load on session restore (so SessionLoadPost hooks run) AND on the relevant
    -- filetypes, so opening a .http file loads the plugin, runs setup() and triggers
    -- the kulala-core backend download + LSP attach.
    event = { "SessionLoadPost" },
    ft = { "http", "rest", "javascript", "typescript", "lua" },
    opts = {
      kulala_core = {
        -- Optional path to a self-managed kulala-core executable.
        -- When nil (default), kulala auto-downloads the backend.
        path = nil,
        -- Subprocess timeout (ms) for kulala-core. 0 disables the timeout.
        timeout = 60000,
        -- Optional override for kulala-core persistence (cookies, OAuth, prompts).
        data_dir = nil,
        download_tool = "curl", -- or "wget"
      },

      -- Restore request history and UI after sourcing a vim session.
      -- Requires `set sessionoptions+=globals` in your Neovim config.
      session = {
        restore = true,
      },

      treesitter = {
        -- Let kulala manage its own tree-sitter parser/queries for HTTP scripts.
        enable = true,
        cli_path = "tree-sitter",
      },

      -- dev, test, prod, can be anything
      default_env = "dev",
      -- "b" = per-buffer env (default), "g" = global
      environment_scope = "g",
      -- enable reading vscode rest client environment variables
      vscode_rest_client_environmentvars = false,

      -- Response body pretty-printing (handled by kulala-core).
      response_format = {
        indent = 2,
        expand_tabs = true,
        sort_keys = false,
      },

      ui = {
        -- display mode: "split" or "float"
        display_mode = "split",
        -- split direction: "above", "right", "below", "left"
        split_direction = "right",
        win_opts = { bo = {}, wo = {} }, ---@type kulala.ui.win_config
        -- default view: "body"|"headers"|"headers_body"|"verbose"|fun(response)
        default_view = "body",
        winbar = true,
        default_winbar_panes = { "body", "headers", "headers_body", "verbose", "script_output", "report", "help" },
        winbar_labels_keymaps = true,
        -- false | "float"
        show_variable_info_text = false,
        -- "signcolumn"|"on_request"|"above_request"|"below_request" or nil
        show_icons = "on_request",
        icons = {
          inlay = {
            loading = "⏳",
            done = "✅",
            error = "❌",
          },
          lualine = "🐼",
          textHighlight = "WarningMsg",
          loadingHighlight = "Normal",
          doneHighlight = "String",
          errorHighlight = "ErrorMsg",
        },

        syntax_hl = {
          ["@punctuation.bracket.kulala_http"] = "Number",
          ["@character.special.kulala_http"] = "Special",
          ["@operator.kulala_http"] = "Special",
          ["@variable.kulala_http"] = "String",
        },

        show_request_summary = true,
        max_response_size = 32768,
        max_request_size = 2048,
        show_images = true,

        report = {
          -- true | false | "on_error"
          show_script_output = true,
          -- true | false | "on_error" | "failed_only"
          show_asserts_output = true,
          -- true | false | "on_error"
          show_summary = true,

          headersHighlight = "Special",
          successHighlight = "String",
          errorHighlight = "Error",
        },

        scratchpad_default_contents = {
          "@MY_TOKEN_NAME=my_token_value",
          "",
          "# @name scratchpad",
          "POST https://httpbin.org/post HTTP/1.1",
          "accept: application/json",
          "content-type: application/json",
          "",
          "{",
          '  "foo": "bar"',
          "}",
        },

        pickers = {
          snacks = {
            layout = function()
              local has_snacks, snacks_picker = pcall(require, "snacks.picker")
              return not has_snacks and {}
                or vim.tbl_deep_extend("force", snacks_picker.config.layout("telescope"), {
                  reverse = true,
                  layout = {
                    { { win = "list" }, { height = 1, win = "input" }, box = "vertical" },
                    { win = "preview", width = 0.6 },
                    box = "horizontal",
                    width = 0.8,
                  },
                })
            end,
          },
        },
      },

      lsp = {
        -- enable/disable built-in LSP server (provides completion, diagnostics,
        -- code actions AND formatting via vim.lsp.buf.format)
        enable = true,

        -- filetypes to attach the Kulala LSP to
        filetypes = {
          "http",
          "rest",
          "javascript",
          "typescript",
          "lua",
        },

        -- Only *.http.js / *.http.ts / *.http.lua files are treated as HTTP scripts
        -- (so your regular js/ts/lua buffers aren't touched). Set false to relax.
        enforce_external_script_naming_convention = true,

        -- enable/disable/customize LSP keymaps. Default is false since Kulala
        -- relies on Neovim's default LSP keymaps (incl. formatting).
        ---@type boolean|table
        keymaps = true,

        on_attach = nil,
      },

      -- debug level
      debug = 3,
      generate_bug_report = false,

      -- enable default global keymaps (prefixed below)
      ---@type boolean|table
      global_keymaps = true,
      global_keymaps_prefix = "<leader>r",

      -- Kulala UI keymaps
      ---@type boolean|table
      kulala_keymaps = true,
      kulala_keymaps_prefix = "",
    },
    keys = {
      {
        "<leader>rIp",
        function()
          require("kulala").import("postman")
        end,
        desc = "Import from Postman",
      },
      {
        "<leader>rIs",
        function()
          require("kulala").import("openapi")
        end,
        desc = "Import from Swagger",
      },
      {
        "<leader>rEf",
        function()
          require("kulala").export("kulala_export")
        end,
        desc = "Export file",
      },
      {
        "<leader>rEc",
        function()
          require("kulala").export("kulala_export")
        end,
        desc = "Export directory",
      },
    },
  },
}
