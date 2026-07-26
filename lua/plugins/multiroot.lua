return {
  {
    dir = "~/projects/configs/multiroot.nvim",
    name = "multiroot.nvim",
    event = "VeryLazy",
    opts = {
      keys_when_active = {
        { "<leader>qc", "<cmd>WorkspaceClose<cr>", desc = "Workspace: close" },
        { "<leader><leader>", "<cmd>WorkspaceFiles<cr>", desc = "Workspace: files" },
        { "<leader>/", "<cmd>WorkspaceGrep<cr>", desc = "Workspace: grep" },
        { "<leader>qa", "<cmd>WorkspaceAddFolder<cr>", desc = "Workspace: add folder" },
        { "<leader>qi", "<cmd>WorkspaceList<cr>", desc = "Workspace: info" },
      },
    },
    keys = {
      { "<leader>qo", "<cmd>WorkspaceOpen<cr>", desc = "Workspace: open" },
      { "<leader>qr", "<cmd>WorkspaceRecent<cr>", desc = "Workspace: recent" },
    },
  },
}
