return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- cmp.confirm({ select = true })
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- remove enter as completion key
        -- ["<CR>"] = function(fallback)
        --   cmp.()
        --   fallback()
        -- end,
      })
    end,
  },
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>",
        backwards_tabkey = "<S-Tab>",
        act_as_tab = true,
        act_as_shift_tab = false,
        default_tab = "<C-t>",
        default_shift_tab = "<C-d>",
        enable_backwards = true,
        completion = false,
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
          { open = "<", close = ">" },
        },
        ignore_beginning = true,
        exclude = {},
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    opt = true,
    event = "InsertCharPre",
    priority = 1000,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
