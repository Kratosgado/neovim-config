return {
  {
    dir = "~/projects/configs/multiroot.nvim",
    name = "multiroot.nvim",
    -- "kratosgado/multiroot.nvim",
    event = "VeryLazy",
    opts = {
      keys_when_active = {
        { "<leader>mc", ":WorkspaceClose<cr>", desc = "Workspace: close" },
        { "<leader><leader>", ":WorkspaceFiles<cr>", desc = "Workspace: files" },
        { "<leader>/", ":WorkspaceGrep<cr>", desc = "Workspace: grep" },
        { "<leader>ma", ":WorkspaceAddFolder<cr>", desc = "Workspace: add folder" },
        { "<leader>mi", ":WorkspaceList<cr>", desc = "Workspace: info" },
        { "<C-/>", ":WorkspaceTerm<cr>", desc = "Workspace: terminal in folder" },
        { "<leader>mt", ":WorkspaceTermRun<cr>", desc = "Workspace: run named terminal" },
        { "<leader>mx", ":WorkspaceTask<cr>", desc = "Workspace: run task" },
        { "<leader>me", ":WorkspaceEdit<cr>", desc = "Workspace: edit file" },
        { "<leader>ml", ":WorkspaceReload<cr>", desc = "Workspace: reload" },
        { "<leader>gg", ":WorkspaceGit<cr>", desc = "Workspace: Neogit at buffer's folder" },
      },
      git = {
        open = function(cwd)
          Snacks.terminal.open("lazygit", { cwd = cwd })
        end,
      },
      auto_load = false,
      on_buf_enter = {
        lcd = true,
      },
    },
    keys = {
      { "<leader>mo", ":WorkspaceOpen<cr>", desc = "Workspace: open" },
      { "<leader>mr", ":WorkspaceRecent<cr>", desc = "Workspace: recent" },
    },
  },

  -- statusline: show current workspace in lualine
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      opts.sections = opts.sections or {}
      opts.sections.lualine_c = opts.sections.lualine_c or {}
      table.insert(opts.sections.lualine_c, {
        function()
          return require("multiroot").statusline()
        end,
        cond = function()
          local ok, mr = pcall(require, "multiroot")
          return ok and mr.current() ~= nil
        end,
      })
    end,
  },

  -- which-key group label for the workspace prefix
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>m", group = "workspace", icon = "" },
      },
    },
  },
}
