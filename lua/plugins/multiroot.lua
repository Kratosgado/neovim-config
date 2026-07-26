return {
  {
    dir = "~/projects/configs/multiroot.nvim",
    name = "multiroot.nvim",
    event = "VeryLazy",
    opts = {
      keys_when_active = {
        { "<leader>qc", ":WorkspaceClose", desc = "Workspace: close" },
        { "<leader><leader>", ":WorkspaceFiles", desc = "Workspace: files" },
        { "<leader>/", ":WorkspaceGrep", desc = "Workspace: grep" },
        { "<leader>qa", ":WorkspaceAddFolder", desc = "Workspace: add folder" },
        { "<leader>qi", ":WorkspaceList", desc = "Workspace: info" },
        { "<leader>qt", ":WorkspaceTerm", desc = "Workspace: terminal in folder" },
        { "<C-/>", ":WorkspaceTermRun", desc = "Workspace: run named terminal" },
      },
    },
    keys = {
      { "<leader>qo", ":WorkspaceOpen", desc = "Workspace: open" },
      { "<leader>qr", ":WorkspaceRecent", desc = "Workspace: recent" },
    },
  },
}
