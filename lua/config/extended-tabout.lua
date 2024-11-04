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
      else
        require("tabout").tabout({ backwards = true }) -- Use Tabout backwards
      end
    end, { "i", "s" }),
  },
})
