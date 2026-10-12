return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      opts.sources = vim.tbl_filter(function(s)
        return s.name ~= "sqlfluff"
      end, opts.sources or {})
    end,
  },
}
