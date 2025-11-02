return {
  --TODO: add settings
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "folke/snacks.nvim",
    },
    opts = {

      popup_type = "vertical",
      provider = "gemini",
      providers = {
        gemini = {
          -- An alternative way to set your API key
          api_key = function()
            return os.getenv("GEMINI_API_KEY")
          end,
          model_id = "gemini-2.5-flash",
          modelVersion = "gemini-2.5-flash",
        },
      },
      search_engine = "google",
      picker = "snacks",
    },
    keys = {
      {
        "<leader>cwd",
        mode = { "n", "x" },
        function()
          require("wtf").diagnose()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        "<leader>cwf",
        mode = { "n", "x" },
        function()
          require("wtf").fix()
        end,
        desc = "Fix diagnostic with AI",
      },
      {
        mode = { "n" },
        "<leader>cws",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
      {
        mode = { "n" },
        "<leader>cwp",
        function()
          require("wtf").pick_provider()
        end,
        desc = "Pick provider",
      },
      {
        mode = { "n" },
        "<leader>cwh",
        function()
          require("wtf").history()
        end,
        desc = "Populate the quickfix list with previous chat history",
      },
      {
        mode = { "n" },
        "<leader>cwg",
        function()
          require("wtf").grep_history()
        end,
        desc = "Grep previous chat history with Telescope",
      },
    },
  },
}
