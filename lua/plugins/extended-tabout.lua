local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item() -- Accept suggestion
      elseif require("tabout").tabout() then
        -- Do nothing, handled by tabout.nvim
      else -- The fallback function sends a single `<Tab>` key
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item() -- Accept suggestion
      elseif require("tabout").backward_tabout() then
      -- Do nothing, handled by tabout.nvim
      else -- The fallback function sends a single `<S-Tab>` key
        fallback()
      end
    end, { "i", "s" }),
  },
})
