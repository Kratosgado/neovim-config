return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      local nls = require("null-ls")

      -- helper to auto-detect common checkstyle locations
      local function get_checkstyle_config(root)
        local candidates = {
          root .. "/checkstyle.xml",
          root .. "/config/checkstyle/checkstyle.xml",
          root .. "/checkstyle/checkstyle.xml",
        }

        for _, path in ipairs(candidates) do
          if vim.loop.fs_stat(path) then
            return path
          end
        end
      end

      return {
        sources = {
          nls.builtins.diagnostics.checkstyle.with({
            args = function(params)
              local config = get_checkstyle_config(params.root)

              if not config then
                return {} -- don’t run if no config found
              end

              return {
                "-f",
                "xml",
                "-c",
                config,
                params.bufname,
              }
            end,
          }),
        },
      }
    end,
  },
}
