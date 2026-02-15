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

-- Option 1: Simple mapping with fixed folder + timestamped filename
vim.keymap.set({ "n", "x" }, "<leader>cS", function()
  local timestamp = os.date("%Y%m%d-%H%M%S")
  local path = vim.fn.expand("~/Pictures/codesnaps/snapshot-" .. timestamp .. ".png")
  vim.cmd("CodeSnapSave " .. vim.fn.shellescape(path))
end, { desc = "CodeSnap: Save with timestamp" })

-- Option 2: Prompt for filename (more flexible)
vim.keymap.set({ "n", "x" }, "<leader>cs", function()
  vim.ui.input({
    prompt = "Save snapshot as (full path, e.g. ~/Pictures/code.png): ",
    completion = "file", -- tab-complete paths
  }, function(input)
    if input and input ~= "" then
      vim.cmd("CodeSnapSave " .. vim.fn.shellescape(input))
    end
  end)
end, { desc = "CodeSnap: Save (prompt)" })
