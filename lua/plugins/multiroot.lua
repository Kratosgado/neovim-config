return {
  {
    -- dir = "~/projects/configs/multiroot.nvim",
    -- name = "multiroot.nvim",
    "kratosgado/multiroot.nvim",
    event = "VeryLazy",
    opts = {
      keys_when_active = {
        { "<leader>qc", ":WorkspaceClose<cr>", desc = "Workspace: close" },
        { "<leader><leader>", ":WorkspaceFiles<cr>", desc = "Workspace: files" },
        { "<leader>/", ":WorkspaceGrep<cr>", desc = "Workspace: grep" },
        { "<leader>qa", ":WorkspaceAddFolder<cr>", desc = "Workspace: add folder" },
        { "<leader>qi", ":WorkspaceList<cr>", desc = "Workspace: info" },
        { "<C-/>", ":WorkspaceTerm<cr>", desc = "Workspace: terminal in folder" },
        { "<leader>qT", ":WorkspaceTermRun<cr>", desc = "Workspace: run named terminal" },
        { "<leader>qx", ":WorkspaceTask<cr>", desc = "Workspace: run task" },
        { "<leader>qe", ":WorkspaceEdit<cr>", desc = "Workspace: edit file" },
      },
    },
    keys = {
      { "<leader>qo", ":WorkspaceOpen<cr>", desc = "Workspace: open" },
      { "<leader>qr", ":WorkspaceRecent<cr>", desc = "Workspace: recent" },
    },
  },
}
