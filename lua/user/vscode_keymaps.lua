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
-- --
-- -- -- general keymaps
-- keymap({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
-- keymap({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
-- keymap({ "n", "v" }, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
-- keymap({ "n", "v" }, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
-- keymap({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
-- keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
-- keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
-- keymap({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
-- keymap({ "n", "v" }, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
-- keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
--
-- keymap({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
-- keymap({ "n", "v" }, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
-- keymap({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
-- local function callVSCodeFunction(vsCodeCommand)
--   vim.cmd(vsCodeCommand)
-- end
--
-- local function vscodeMappings()
--   keymap("n", "<C-/>", function()
--     callVSCodeFunction("call VSCodeCall('workbench.action.terminal.focus')")
--   end, { noremap = true, silent = true, desc = "toggle terminal" })
--
--   keymap("t", "<C-l>", function()
--     print("next term")
--     callVSCodeFunction("call VSCodeCall('workbench.action.terminal.focusNextPane')")
--   end, { noremap = true, silent = true, desc = "cycle terminal focus" })
--
--   keymap("t", "<C-h>", function()
--     print("prev term")
--     callVSCodeFunction("call VSCodeCall('workbench.action.terminal.focusPreviousPane')")
--   end, { noremap = true, silent = true, desc = "cycle terminal focus" })
--
--   keymap("n", "<leader>cs", function()
--     print("go to symbols in editor")
--     callVSCodeFunction("call VSCodeCall('workbench.action.gotoSymbol')")
--   end, { noremap = true, silent = true, desc = "go to symbols in editor" })
--
--   keymap("n", "<S-l>", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.action.nextEditor')")
--   end, { noremap = true, desc = "switch between editor to next" })
--
--   keymap("n", "<S-h>", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.action.previousEditor')")
--   end, { noremap = true, desc = "switch between editor to previous" })
--
--   keymap("n", "gr", function()
--     callVSCodeFunction("call VSCodeNotify('editor.action.referenceSearch.trigger')")
--   end, { noremap = true, desc = "peek references inside vs code" })
--
--   keymap("n", "<leader>sd", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.action.problems.focus')")
--   end, { noremap = true, desc = "open problems and errors infos" })
--
--   keymap("n", "<leader>e", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.files.action.focusFilesExplorer')")
--   end, { noremap = true, desc = "focus to file explorer" })
--
--   keymap("n", "<leader>fe", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.files.action.focusFilesExplorer')")
--   end, { noremap = true, desc = "focus to file explorer" })
--
--   keymap("n", "<leader><leader>", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.action.quickOpen')")
--   end, { noremap = true, desc = "open files" })
--
--   keymap("n", "<leader>gg", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.view.scm')")
--   end, { noremap = true, desc = "open git source control" })
--
--   keymap("n", "<leader>sml", function()
--     callVSCodeFunction("call VSCodeNotify('bookmarks.list')")
--   end, { noremap = true, desc = "open bookmarks list for current files" })
--
--   keymap("n", "<leader>smL", function()
--     callVSCodeFunction("call VSCodeNotify('bookmarks.listFromAllFiles')")
--   end, { noremap = true, desc = "open bookmarks list for all files" })
--
--   keymap("n", "<leader>smm", function()
--     callVSCodeFunction("call VSCodeNotify('bookmarks.toggle')")
--   end, { noremap = true, desc = "toggle bookmarks" })
--
--   keymap("n", "<leader>smd", function()
--     callVSCodeFunction("call VSCodeNotify('bookmarks.clear')")
--   end, { noremap = true, desc = "clear bookmarks from current file" })
--
--   keymap("n", "<leader>smr", function()
--     callVSCodeFunction("call VSCodeNotify('bookmarks.clearFromAllFiles')")
--   end, { noremap = true, desc = "clear bookmarks from all file" })
--
--   keymap("n", "<leader>cr", function()
--     callVSCodeFunction("call VSCodeNotify('editor.action.rename')")
--   end, { noremap = true, desc = "rename symbol" })
--
--   keymap("n", "<leader>ca", function()
--     callVSCodeFunction("call VSCodeNotify('editor.action.quickFix')")
--   end, { noremap = true, desc = "open quick fix in vs code" })
--
--   keymap("n", "<leader>cA", function()
--     callVSCodeFunction("call VSCodeNotify('editor.action.sourceAction')")
--   end, { noremap = true, desc = "open source Action in vs code" })
--
--   keymap("n", "<leader>cp", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.panel.markers.view.focus')")
--   end, { noremap = true, desc = "open problems diagnostics" })
--
--   keymap("n", "<leader>cd", function()
--     callVSCodeFunction("call VSCodeNotify('editor.action.marker.next')")
--   end, { noremap = true, desc = "open problems diagnostics" })
--
--   keymap({ "v" }, "<C-c>", function()
--     callVSCodeFunction("call VSCodeNotify('editor.action.clipboardCopyAction')")
--     print("📎added to clipboard!")
--   end, { noremap = true, desc = "copy text/add text to clipboard" })
--
--   keymap({ "n" }, "u", function()
--     callVSCodeFunction("call VSCodeNotify('undo')")
--   end, { noremap = true, desc = "undo changes" })
--
--   keymap({ "n" }, "<C-r>", function()
--     callVSCodeFunction("call VSCodeNotify('redo')")
--   end, { noremap = true, desc = "redo changes" })
--
--   keymap("n", "<leader>cix", function()
--     callVSCodeFunction("call VSCodeNotify('chatgpt.openSidebar')")
--     print("🤖 Opening ChatGPT Codex...")
--   end, { noremap = true, silent = true, desc = "open ChatGPT Codex sidebar" })
--
--   keymap("n", "<leader>cic", function()
--     callVSCodeFunction("call VSCodeNotify('workbench.action.focusAuxiliaryBar')")
--     print("🔧 Opening Cursor...")
--   end, { noremap = true, silent = true, desc = "open cursor auxiliary bar" })
--
--   keymap("n", "<leader>cia", function()
--     callVSCodeFunction("call VSCodeNotify('vscode-augment.startNewChat')")
--     print("✨ Starting Augment Chat...")
--   end, { noremap = true, silent = true, desc = "start new augment chat" })
--
--   keymap("n", "<leader>cik", function()
--     callVSCodeFunction("call VSCodeNotify('kiroAgent.newSession')")
--     print("✨ Starting new session i kiro")
--   end, { noremap = true, silent = true, desc = "start new kiro session" })
-- end
-- print("⚡connected to neovim!💯")
-- vscodeMappings()
