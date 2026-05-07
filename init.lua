-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- VSCode extension
  -- require("user.vscode_keymaps")

  vim.o.cmdheight = 2
end
require("config.lazy")
