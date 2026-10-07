return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        java = { "google-java-format" },
        -- kulala-fmt formats .http / .rest files
        http = { "kulala-fmt" },
        rest = { "kulala-fmt" },
      },
      formatters = {
        -- Override the built-in kulala-fmt formatter so it uses the Linux
        -- kulala-core binary we built (the one kulala.nvim uses), instead of
        -- trying to download its own backend (no Linux release exists upstream).
        ["kulala-fmt"] = {
          env = {
            KULALA_CORE_PATH = vim.fn.stdpath("data") .. "/kulala.nvim/bin/kulala-core",
          },
        },
      },
    },
  },
}
