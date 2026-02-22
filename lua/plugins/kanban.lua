return {
  {
    "hasansujon786/super-kanban.nvim",
    dependencies = {
      "folke/snacks.nvim", -- required
      "folke/flash.nvim", -- optional for jump navigation
    },
    cmd = { "SuperKanban" }, -- lazy load on command
    opts = {
      markdown = {
        notes_dir = "./kanban/tasks/",
        list_heading = "h2",
      },
      mappings = {
        ["H"] = "jump_left",
        ["L"] = "jump_right",
        ["J"] = "jump_down",
        ["K"] = "jump_up",
      },
    },
    keys = {
      -- Board operations
      { "<leader>kb", "<cmd>SuperKanban<cr>", desc = "Kanban: Show commands" },
      { "<leader>ko", "<cmd>SuperKanban open<cr>", desc = "Kanban: Open board" },
      { "<leader>kc", "<cmd>SuperKanban create<cr>", desc = "Kanban: Create board" },

      -- List operations
      { "<leader>kln", "<cmd>SuperKanban list create<cr>", desc = "Kanban: Create list" },
      { "<leader>klr", "<cmd>SuperKanban list rename<cr>", desc = "Kanban: Rename list" },
      { "<leader>kld", "<cmd>SuperKanban list delete<cr>", desc = "Kanban: Delete list" },
      { "<leader>klm", "<cmd>SuperKanban list move<cr>", desc = "Kanban: Move list" },
      { "<leader>klj", "<cmd>SuperKanban list jump<cr>", desc = "Kanban: Jump to list" },
      { "<leader>kls", "<cmd>SuperKanban list sort<cr>", desc = "Kanban: Sort list" },

      -- Card operations
      { "<leader>kcn", "<cmd>SuperKanban card create<cr>", desc = "Kanban: Create card" },
      { "<leader>kcd", "<cmd>SuperKanban card delete<cr>", desc = "Kanban: Delete card" },
      { "<leader>kct", "<cmd>SuperKanban card toggle<cr>", desc = "Kanban: Toggle card" },
      { "<leader>kca", "<cmd>SuperKanban card archive<cr>", desc = "Kanban: Archive card" },
      { "<leader>kcc", "<cmd>SuperKanban card date<cr>", desc = "Kanban: Set card date" },
      { "<leader>kcs", "<cmd>SuperKanban card search<cr>", desc = "Kanban: Search cards" },
      { "<leader>kce", "<cmd>SuperKanban card note<cr>", desc = "Kanban: Edit card note" },
      { "<leader>kcm", "<cmd>SuperKanban card move<cr>", desc = "Kanban: Move card" },
      { "<leader>kcj", "<cmd>SuperKanban card jump<cr>", desc = "Kanban: Jump to card" },
    },
  },
}
