-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume last telescope session" }
)
vim.keymap.set({ "i", "t", "n", "v", "c", "o", "x" }, ";;", "<Esc>", { noremap = true, silent = true })
vim.keymap.set({ "n", "t" }, ";;", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-e>" -- close the popup menu
  else
    return "<Esc>"
  end
end, { expr = true, noremap = true, silent = true })
