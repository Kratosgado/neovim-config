-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- VSCode extension
  -- require("user.vscode_keymaps")

  vim.o.cmdheight = 20
end
require("config.lazy")
