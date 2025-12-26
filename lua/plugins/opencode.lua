return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      -- vim.g.opencode_opts = {}
      require("lualine").setup({
        sections = {
          lualine_z = {
            {
              require("opencode").statusline,
            },
          },
        },
      })
      -- Handle `opencode` events
      vim.api.nvim_create_autocmd("User", {
        pattern = "OpencodeEvent:*", -- Optionally filter event types
        callback = function(args)
          ---@type opencode.cli.client.Event
          local event = args.data.event
          ---@type number
          local port = args.data.port

          -- See the available event types and their properties
          vim.notify(vim.inspect(event))
          -- Do something useful
          if event.type == "session.idle" then
            vim.notify("`opencode` finished responding")
          end
        end,
      })
      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ "n", "x" }, "<leader>aa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode" })
      vim.keymap.set({ "n", "x" }, "<leader>ae", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "t" }, "<leader>at", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { expr = true, desc = "Add range to opencode" })
      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { expr = true, desc = "Add line to opencode" })

      vim.keymap.set("n", "<C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "opencode half page up" })
      vim.keymap.set("n", "<C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "opencode half page down" })
    end,
  },
}
