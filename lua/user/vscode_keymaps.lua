print("🔌 Setting up VS Code keymaps...")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap({ "n", "v" }, "<Space>", "", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

keymap("n", "<leader>ff", function()
  require("vscode").action("workbench.action.quickOpen")
end, { desc = "Find files" })
-- Helper function for VS Code commands
local vscode = require("vscode")
local function cmd(name)
  return function()
    vscode.call(name)
  end
end

-- Navigation / LSP (Matches your gd, gr, K, etc.)
keymap("n", "K", cmd("editor.action.showHover"))
keymap("n", "gd", cmd("editor.action.revealDefinition"))
keymap("n", "gr", cmd("editor.action.goToReferences"))
keymap("n", "gi", cmd("editor.action.goToImplementation"))
keymap("n", "<leader>ca", cmd("editor.action.quickFix"))

-- File / Buffer Management (Matches your Space b b, Space f f)
keymap("n", "<leader><leader>", cmd("workbench.action.quickOpen"))
keymap("n", "<leader>ff", cmd("workbench.action.quickOpen"))
keymap("n", "<leader>bb", cmd("workbench.action.showAllEditorsByAppearance"))
keymap("n", "<leader>bd", cmd("workbench.action.closeActiveEditor"))

-- Window Splits (Matches your Space | and Space -)
keymap("n", "<leader>|", cmd("workbench.action.splitEditorRight"))
keymap("n", "<leader>-", cmd("workbench.action.splitEditorDown"))

-- Search (Matches your Space /)
keymap("n", "<leader>/", cmd("workbench.action.findInFiles"))

print("✅ VS Code keymaps set up!")
