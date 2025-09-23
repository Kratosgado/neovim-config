return {
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup({
        window = {
          split_ratio = 0.3, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
          position = "botright", -- Position of the window: "botright", "topleft", "vertical", "float", etc.
          enter_insert = true, -- Whether to enter insert mode when opening Claude Code
          hide_numbers = true, -- Hide line numbers in the terminal window
          hide_signcolumn = true, -- Hide the sign column in the terminal window

          -- Floating window configuration (only applies when position = "float")
          float = {
            width = "80%", -- Width: number of columns or percentage string
            height = "80%", -- Height: number of rows or percentage string
            row = "center", -- Row position: number, "center", or percentage string
            col = "center", -- Column position: number, "center", or percentage string
            relative = "editor", -- Relative to: "editor" or "cursor"
            border = "rounded", -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
          },
        },
        -- File refresh settings
        refresh = {
          enable = true, -- Enable file change detection
          updatetime = 100, -- updatetime when Claude Code is active (milliseconds)
          timer_interval = 1000, -- How often to check for file changes (milliseconds)
          show_notifications = true, -- Show notification when files are reloaded
        },
        -- Shell-specific settings
        shell = {
          separator = "&&", -- Command separator used in shell commands
          pushd_cmd = "pushd", -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
          popd_cmd = "popd", -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
        },
        -- Command settings
        command = "claude", -- Command used to launch Claude Code
        -- Command variants
        command_variants = {
          -- Conversation management
          continue = "--continue", -- Resume the most recent conversation
          resume = "--resume", -- Display an interactive conversation picker

          -- Output options
          verbose = "--verbose", -- Enable verbose logging with full turn-by-turn output
        },
        -- Keymaps
        keymaps = {
          toggle = {
            normal = "<C-c>", -- Normal mode keymap for toggling Claude Code, false to disable
            terminal = "<C-,>", -- Terminal mode keymap for toggling Claude Code, false to disable
            variants = {
              continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
              verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
            },
          },
          window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
          scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
        },
      })
    end,
  },
  {
    "wtfox/claude-chat.nvim",
    config = true,
    opts = {
      -- Optional configuration
      split = "vsplit", -- "vsplit", "split", or "float"
      position = "right", -- "right", "left", "top", "bottom" (ignored for float)
      width = 0.6, -- percentage of screen width (for vsplit or float)
      height = 0.8, -- percentage of screen height (for split or float)
      claude_cmd = "claude", -- command to invoke Claude Code
      float_opts = { -- options for floating window
        relative = "editor",
        border = "rounded",
        title = " Claude Chat ",
        title_pos = "center",
      },
      keymaps = { -- customize if needed
        global = "<leader>cc",
        terminal = {
          close = "<C-q>",
          toggle = "<C-.>",
        },
      },
    },
  },
}
