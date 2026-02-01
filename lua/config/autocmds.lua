-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Dev.sh project automation

local dev_sh_autocmds = vim.api.nvim_create_augroup("DevShAutocmds", { clear = true })

-- Track current project to avoid duplicate executions
local current_project_root = nil

-- Execute dev.sh start section when entering a project
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  group = dev_sh_autocmds,
  callback = function()
    local root = vim.fn.getcwd()

    -- Skip if we're already in this project
    if current_project_root == root then
      return
    end

    -- Execute exit for previous project if exists
    if current_project_root and vim.fn.filereadable(current_project_root .. "/dev.sh") == 1 then
      vim.fn.system("cd " .. vim.fn.shellescape(current_project_root) .. " && bash dev.sh exit 2>/dev/null")
    end

    -- Check for dev.sh in current directory
    local dev_sh_path = root .. "/dev.sh"
    if vim.fn.filereadable(dev_sh_path) == 1 then
      current_project_root = root

      -- Execute start section
      local result = vim.fn.system("cd " .. vim.fn.shellescape(root) .. " && bash dev.sh start 2>/dev/null")
      if vim.v.shell_error == 0 then
        vim.notify("dev.sh start executed for project: " .. vim.fn.fnamemodify(root, ":t"), vim.log.levels.INFO)
      else
        vim.notify("dev.sh start failed or no start section found", vim.log.levels.WARN)
      end
    else
      current_project_root = root -- Still track the root even without dev.sh
    end
  end,
})

-- Execute dev.sh exit section when leaving Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = dev_sh_autocmds,
  callback = function()
    if current_project_root and vim.fn.filereadable(current_project_root .. "/dev.sh") == 1 then
      local result =
        vim.fn.system("cd " .. vim.fn.shellescape(current_project_root) .. " && bash dev.sh exit 2>/dev/null")
      if vim.v.shell_error == 0 then
        print("dev.sh exit executed")
      end
    end
  end,
})

--- Lua
vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ "InsertLeavePre", "TextChanged", "TextChangedP" }, {
  pattern = { "*.html", "*.css" },
  callback = function()
    vim.cmd("silent! write")
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "GitConflictDetected",
  callback = function()
    vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
    vim.keymap.set("n", "cww", function()
      engage.conflict_buster()
      create_buffer_local_mappings()
    end)
  end,
})

-- Open PDFs with PDFview
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.pdf",
  callback = function()
    local file_path = vim.api.nvim_buf_get_name(0)
    require("pdfview").open(file_path)
  end,
})
vim.ui.select = require("snacks.picker").select
