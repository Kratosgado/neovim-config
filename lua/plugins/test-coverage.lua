return {
  -- {
  --   "dsych/blanket.nvim",
  --   ft = "java",
  --   opts = {
  --     report_path = vim.fn.getcwd() .. "/target/site/jacoco/jacoco.xml",
  --     filetypes = "java",
  --     igns = {
  --       priority = 10,
  --       incomplete_branch_color = "WarningMsg",
  --       covered_color = "DiagnosticOk",
  --       uncovered_color = "Error",
  --     },
  --   },
  --   keys = {
  --     { "<leader>tcp", "<cmd>lua require('blanket').pick_report_path()<CR>", desc = "Pick JaCoCo Report" },
  --     { "<leader>tcc", "<cmd>lua require('blanket').refresh()<cr>", desc = "Refresh Coverage" },
  --     { "<leader>tcS", "<cmd>lua require('blanket').start()<cr>", desc = "Start Blanket" },
  --     { "<leader>tcX", "<cmd>lua require('blanket').stop()<cr>", desc = "Stop Blanket" },
  --     {
  --       "<leader>tcr",
  --       "<cmd>TermExec cmd='mvn test jacoco:report'<cr>",
  --       desc = "Maven: Run Tests & Coverage",
  --     },
  --   },
  -- },
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
      },
      lang = {
        java = {
          coverage_file = vim.fn.getcwd() .. "/target/site/jacoco/jacoco.xml",
        },
      },
    },
  },
}
