return {
  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              settings = {
                java = {
                  jdk = {
                    auto_install = true,
                    version = "21.0.8",
                  },
                  configuration = {
                    runtimes = {
                      {
                        name = "JavaSE-21",
                        path = "/usr/lib/jvm/java-21-openjdk-amd64/",
                        default = true,
                      },
                    },
                  },
                },
              },
            },
          },
          setup = {
            jdtls = function()
              require("java").setup({

                -- Your custom nvim-java configuration goes here
              })
            end,
          },
        },
      },
    },
  },
}
