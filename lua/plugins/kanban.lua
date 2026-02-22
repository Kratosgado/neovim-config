return {
  {
    "arakkkkk/kanban.nvim",
    config = function()
      -- Choose where to store task description files:
      -- 1) If inside a git project, keep tasks scoped to the project under `.kanban/tasks`
      -- 2) Otherwise fallback to your Obsidian vault (personal) under `~/vaults/personal/tasks`
      local function get_git_root()
        local out = vim.fn.systemlist("git rev-parse --show-toplevel")
        if vim.v.shell_error == 0 and out[1] and out[1] ~= "" then
          return out[1]
        end
        return nil
      end

      local function ensure_dir(dir)
        if vim.fn.isdirectory(dir) == 0 then
          vim.fn.mkdir(dir, "p")
        end
      end

      local function task_folder()
        local git_root = get_git_root()
        if git_root then
          local dir = git_root .. "/.kanban/tasks"
          ensure_dir(dir)
          return dir
        end

        -- fallback to Obsidian personal vault (matches your obsidian.lua workspaces)
        local obsidian_tasks = vim.fn.expand("~/vaults/personal/tasks")
        ensure_dir(obsidian_tasks)
        return obsidian_tasks
      end

      require("kanban").setup({
        markdown = {
          description_folder = task_folder(), -- dynamic path picked at startup
          list_head = "## ",
        },
      })
    end,
  },
}
