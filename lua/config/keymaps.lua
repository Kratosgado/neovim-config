-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume last telescope session" }
)

map({ "i", "t", "n", "v", "c", "o", "x" }, ";;", "<Esc>", { noremap = true, silent = true })
map({ "n", "t" }, ";;", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-e>" -- close the popup menu
  else
    return "<Esc>"
  end
end, { expr = true, noremap = true, silent = true })

-- map("n", "<leader>gg", "<Plug>(git-conflict-ours)", { desc = "Use the current buffer's changes" })
-- map("n", "<leader>gi", "<Plug>(git-conflict-theirs)", { desc = "Use the other buffer's changes" })
-- map("n", "<leader>ga", "<Plug>(git-conflict-both)", { desc = "Use both changes" })
-- map("n", "<leader>g0", "<Plug>(git-conflict-none)", { desc = "Use no changes" })
-- map("n", "<leader>gp", "<Plug>(git-conflict-prev-conflict)", { desc = "Jump to the previous conflict" })
-- map("n", "<leader>gn", "<Plug>(git-conflict-next-conflict)", { desc = "Jump to the next conflict" })
