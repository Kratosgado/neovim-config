return {
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neotest/neotest" },
    keys = {
      { "<leader>tcl", "<cmd>CoverageLoad<cr>", desc = "Load Coverage" },
      { "<leader>tct", "<cmd>CoverageToggle<cr>", desc = "Toggle Coverage Signs" },
      { "<leader>tcs", "<cmd>CoverageSummary<cr>", desc = "Coverage Summary" },
    },
    opts = {
      auto_reload = true,
      highlights = {
        -- "DiagnosticOk" or "String" (#9ece6a) are the best greens in Tokyo Night
        covered = { fg = "#9ece6a" },
        uncovered = { fg = "#f7768e" }, -- Tokyo Night Red
        partial = { fg = "#e0af68" }, -- Tokyo Night Yellow
      },
      lang = {
        java = {
          coverage_file = vim.fn.getcwd() .. "/target/site/jacoco/jacoco.xml",
        },
      },
    },
  },
}
