return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
  -- opts = {
  --   server = {
  --
  --     cmd = {
  --       "sonarlint-language-server",
  --       -- Ensure that sonarlint-language-server uses stdio channel
  --       "-stdio",
  --       "-analyzers",
  --       -- paths to the analyzers you need, using those for python and java in this example
  --       vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
  --       vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
  --       vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
  --     },
  --     -- Replace with your hosted server URL
  --     url = "https://sonar-qube.amalitech-dev.net",
  --     -- Provide your generated token here
  --     token = "squ_690f49b46d891286c43eaa67de768a075be0c9b3",
  --   },
  --   settings = {
  --     sonarlint = {
  --       -- Map your local project to the SonarQube project key
  --       connectedMode = {
  --         project = {
  --           projectKey = "Amali-Tech_achievement-utilization-tracking-backend_534b7bdd-0ea1-4204-9af6-0a079194c59c",
  --         },
  --       },
  --       -- Language specific settings (e.g., for Java)
  --       languages = {
  --         java = {
  --           enabled = true,
  --         },
  --       },
  --     },
  --   },
  -- },
  config = function(_, opts)
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          -- Ensure that sonarlint-language-server uses stdio channel
          "-stdio",
          "-analyzers",
          -- paths to the analyzers you need, using those for python and java in this example
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        },
      },
      filetypes = {
        -- Tested and working
        "cs",
        "dockerfile",
        "python",
        "cpp",
        "java",
      },
    })
  end,
}
