-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- VSCode extension
  -- require("user.vscode_keymaps")

  vim.o.cmdheight = 20
elseif vim.g.neovide then
  vim.env.PATH = vim.env.PATH .. ":/usr/bin:/usr/local/bin:" .. vim.env.HOME .. "/.fzf/bin"
  vim.o.guifont = "ComicShannsMono Nerd Font:h8"

  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_scroll_animation_length = 0.2
end
require("config.lazy")
