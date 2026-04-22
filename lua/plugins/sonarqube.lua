return {
  "schrieveslaach/sonarlint.nvim",
  dependencies = { "mfussenegger/nvim-jdtls" }, -- Required for Java support
  opts = {
    server = {
      -- Replace with your hosted server URL
      url = "https://your-sonarqube-server.com",
      -- Provide your generated token here
      token = "your_sonarqube_token",
    },
    settings = {
      sonarlint = {
        -- Map your local project to the SonarQube project key
        connectedMode = {
          project = {
            projectKey = "your_project_key",
          },
        },
        -- Language specific settings (e.g., for Java)
        languages = {
          java = {
            enabled = true,
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("sonarlint").setup(opts)
  end,
}
