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

      connected = {
        -- client_id is the ID of the Sonar LSP
        -- url is the url it wants to connect to
        get_credentials = function(client_id, url)
          -- This must return a string (User token)
          -- This is the default function. You can just set the environment variable.
          return vim.fn.getenv("SONAR_TOKEN")
        end,
      },
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
        settings = {
          sonarlint = {
            connectedMode = {
              connections = {
                sonarqube = {
                  {
                    -- connectionId = "<server id to use in projects>",
                    -- this is the url that will go into get_credentials
                    serverUrl = "https://sonar-qube.amalitech-dev.net",
                    disableNotifications = false,
                  },
                },
              },
            },
          },
        },

        before_init = function(params, config)
          -- Your personal configuration needs to provide a mapping of root folders and project keys
          --
          -- In the future a integration with https://github.com/folke/neoconf.nvim or some similar
          -- plugin, might be worthwhile.
          local project_root_and_ids = {
            ["~/projects/java/auts/"] = "Amali-Tech_achievement-utilization-tracking-backend_534b7bdd-0ea1-4204-9af6-0a079194c59c",
            -- … further mappings …
          }

          config.settings.sonarlint.connectedMode.project = {
            -- connectionId = "<server id from above>",
            projectKey = project_root_and_ids[params.rootPath],
          }
        end,
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
