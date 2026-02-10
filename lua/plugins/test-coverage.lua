local function find_jacoco_report()
  local file_dir = vim.fn.expand("%:p:h")
  local report = vim.fs.find("jacoco.xml", {
    path = file_dir,
    upward = true,
    stop = vim.loop.os_homedir(),
  })[1]
  return report or "target/site/jacoco/jacoco.xml"
end

return {
  {
    "dsych/blanket.nvim",
    ft = "java",
    opts = function()
      return {
        report_path = find_jacoco_report(),
        filetypes = "java",
      }
    end,
    keys = {
      { "<leader>tcp", "<cmd>lua require('blanket').pick_report_path()<CR>", desc = "Pick JaCoCo Report" },
      { "<leader>tcc", "<cmd>lua require('blanket').refresh()<cr>", desc = "Refresh Coverage" },
      { "<leader>tcS", "<cmd>lua require('blanket').start()<cr>", desc = "Start Blanket" },
      { "<leader>tcX", "<cmd>lua require('blanket').stop()<cr>", desc = "Stop Blanket" },
      {
        "<leader>tcr",
        "<cmd>TermExec cmd='mvn test jacoco:report'<cr>",
        desc = "Maven: Run Tests & Coverage",
      },
    },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neotest/neotest" },
    cmd = { "Coverage", "CoverageLoad", "CoverageToggle" },
    keys = {
      { "<leader>tcl", "<cmd>CoverageLoad<cr>", desc = "Load Coverage" },
      { "<leader>tct", "<cmd>CoverageToggle<cr>", desc = "Toggle Coverage Signs" },
      { "<leader>tcs", "<cmd>CoverageSummary<cr>", desc = "Coverage Summary" },
    },
    opts = {
      auto_reload = true,
      lang = {
        java = {
          coverage_file = find_jacoco_report(),
        },
      },
    },
  },
}
