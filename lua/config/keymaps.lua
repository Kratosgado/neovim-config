-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map({ "i", "c", "o" }, "jk", "<Esc>", { noremap = true, silent = true })
map({ "i", "c", "o" }, "JK", "<Esc>", { noremap = true, silent = true })
map("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
map({ "i" }, "jk", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-e>" -- close the popup menu
  else
    return "<Esc>"
  end
end, { expr = true, noremap = true, silent = true })
-- Open compiler
map("n", "<leader>Co", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
map(
  "n",
  "<leader>Cr",
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
    .. "<cmd>CompilerRedo<cr>",
  { noremap = true, silent = true }
)
map("n", "<leader>Ct", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
-- map("n", "<leader>gg", "<Plug>(git-conflict-ours)", { desc = "Use the current buffer's changes" })
-- map("n", "<leader>gi", "<Plug>(git-conflict-theirs)", { desc = "Use the other buffer's changes" })
-- map("n", "<leader>ga", "<Plug>(git-conflict-both)", { desc = "Use both changes" })
-- map("n", "<leader>g0", "<Plug>(git-conflict-none)", { desc = "Use no changes" })
-- map("n", "<leader>gp", "<Plug>(git-conflict-prev-conflict)", { desc = "Jump to the previous conflict" })
-- map("n", "<leader>gn", "<Plug>(git-conflict-next-conflict)", { desc = "Jump to the next conflict" })
