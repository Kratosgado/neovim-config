return {
  "schrieveslaach/sonarlint.nvim",
  dependencies = { "mfussenegger/nvim-jdtls" }, -- Required for Java support
  opts = {
    server = {
      -- Replace with your hosted server URL
      url = "https://sonar-qube.amalitech-dev.net",
      -- Provide your generated token here
      token = "squ_690f49b46d891286c43eaa67de768a075be0c9b3",
    },
    settings = {
      sonarlint = {
        -- Map your local project to the SonarQube project key
        connectedMode = {
          project = {
            projectKey = "Amali-Tech_achievement-utilization-tracking-backend_534b7bdd-0ea1-4204-9af6-0a079194c59c",
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
