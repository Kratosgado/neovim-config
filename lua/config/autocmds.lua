-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Dev.sh project automation

--- Lua
vim.api.nvim_create_autocmd({ "InsertLeavePre", "TextChanged", "TextChangedP" }, {
  pattern = { "*.html", "*.css" },
  callback = function()
    vim.cmd("silent! write")
  end,
})

vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd("edit " .. vim.lsp.get_log_path())
end, {})

vim.api.nvim_create_user_command("LspInfo", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    vim.notify("No LSP clients attached to this buffer", vim.log.levels.WARN)
    return
  end
  local lines = {}
  for _, client in ipairs(clients) do
    table.insert(lines, string.format("• %s (id=%d)  root: %s", client.name, client.id, client.root_dir or "none"))
  end
  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "LSP Clients" })
end, {})
