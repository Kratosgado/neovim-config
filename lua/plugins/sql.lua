local function remove(list, value)
  if type(list) ~= "table" then
    return
  end
  for i = #list, 1, -1 do
    if list[i] == value then
      table.remove(list, i)
    end
  end
end

return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      remove(opts.ensure_installed, "sqlfluff")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      for _, linters in pairs(opts.linters_by_ft or {}) do
        remove(linters, "sqlfluff")
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      if opts.formatters then
        opts.formatters.sqlfluff = nil
      end
      for _, formatters in pairs(opts.formatters_by_ft or {}) do
        remove(formatters, "sqlfluff")
      end
    end,
  },
}
