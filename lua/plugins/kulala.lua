return {
  {
    "mistweaverco/kulala.nvim",
    opts = {
      curl_path = "curl",

      -- Display mode, possible values: "split", "float"
      display_mode = "split",

      -- split direction
      -- possible values: "vertical", "horizontal"
      split_direction = "vertical",

      -- default_view, body or headers or headers_body
      default_view = "body",

      -- dev, test, prod, can be anything
      -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
      default_env = "dev",
      debug = false,
      -- default formatters/pathresolver for different content types
      contenttypes = {
        ["application/json"] = {
          ft = "json",
          formatter = { "jq", "." },
        },
        ["text/html"] = {
          ft = "html",
          formatter = { "xmllint", "--format", "--html", "-" },
          pathresolver = {},
        },
      },
      -- additional cURL options
      -- see: https://curl.se/docs/manpage.html
      additional_curl_options = {},
      show_icons = "on_request",
      icons = {
        inlay = {
          loading = "⏳",
          done = "✅",
          error = "❌",
        },
        lualine = "🐼",
      },
      scratchpad_default_contents = {
        "token=value",
        "",
        "# @name scratchpad",
        "accept: application/json",
        "content-type: application/json",
        "",
      },

      -- enable winbar
      winbar = false,

      -- Specify the panes to be displayed by default
      -- Current available pane contains { "body", "headers", "headers_body", "script_output", "stats" },
      default_winbar_panes = { "body", "headers_body", "script_output" },

      -- enable reading vscode rest client environment variables
      vscode_rest_client_environmentvars = false,

      -- disable the vim.print output of the scripts
      -- they will be still written to disk, but not printed immediately
      disable_script_print_output = false,

      -- set scope for environment and request variables
      -- possible values: b = buffer, g = global
      environment_scope = "b",

      -- certificates
      certificates = {},
    },
  },
}
