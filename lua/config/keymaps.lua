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

-- Keymaps for kulala
vim.api.nvim_buf_set_keymap(0, "n", "[", "<cmd>lua require('kulala').jump_prev()<cr>", {
        noremap = true,
        silent = true,
        desc = "Jump to the previous request",
})
vim.keymap.set({ "n", "t" }, "[", "<cmd>lua require('kulala').jump_prev()<cr>", {
        noremap = true,
        silent = true,
        desc = "Jump to the previous request",
})
-- kulala run all request in file
vim.keymap.set({ "n", "t" }, "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", {
        noremap = true,
        silent = true,
        desc = "Run all request in file",
})
-- kulala run current request
vim.keymap.set({ "n", "t" }, "<leader>rr", "<cmd>lua require('kulala').run()<cr>", {
        noremap = true,
        silent = true,
        desc = "Run current request",
})
-- kulala run last request
vim.keymap.set({ "n", "t" }, "<leader>rl", "<cmd>lua require('kulala').run_last()<cr>", {
        noremap = true,
        silent = true,
        desc = "Run last request",
})

vim.keymap.set("n", "<leader>gg", "<Plug>(git-conflict-ours)", { desc = "Use the current buffer's changes" })
vim.keymap.set("n", "<leader>gi", "<Plug>(git-conflict-theirs)", { desc = "Use the other buffer's changes" })
vim.keymap.set("n", "<leader>ga", "<Plug>(git-conflict-both)", { desc = "Use both changes" })
vim.keymap.set("n", "<leader>g0", "<Plug>(git-conflict-none)", { desc = "Use no changes" })
vim.keymap.set("n", "<leader>gp", "<Plug>(git-conflict-prev-conflict)", { desc = "Jump to the previous conflict" })
vim.keymap.set("n", "<leader>gn", "<Plug>(git-conflict-next-conflict)", { desc = "Jump to the next conflict" })
