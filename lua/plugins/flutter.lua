return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      -- Prefer flutter on PATH; fall back to this machine's snap install so the
      -- config stays portable.
      local flutter_path = vim.fn.exepath("flutter")
      if flutter_path == "" then
        flutter_path = "/home/esslifie/snap/flutter/common/flutter/bin/flutter"
      end

      -- Join whatever terminal window is already open (vsplit into it, same as
      -- a second terminal joining the row) instead of opening a fresh
      -- full-width split. Falls back to a new bottom split when no terminal
      -- is open yet.
      vim.api.nvim_create_user_command("FlutterDevLogOpen", function(cmd_opts)
        local name = cmd_opts.args
        local term_win
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          if vim.bo[vim.api.nvim_win_get_buf(win)].buftype == "terminal" then
            term_win = win
            break
          end
        end
        if term_win then
          -- nvim_win_call has no side effects on the current window/buffer,
          -- so ui.open_win's nvim_get_current_buf() right after this command
          -- returns would see whatever was current before (not the new log
          -- buffer). Switch for real so the new split stays current.
          vim.api.nvim_set_current_win(term_win)
          vim.cmd("vertical belowright split " .. name)
        else
          vim.cmd("belowright " .. math.floor(vim.o.lines * 0.4) .. "split " .. name)
        end
      end, { nargs = 1 })

      require("flutter-tools").setup({
        flutter_path = flutter_path,
        decorations = {
          statusline = {
            app_version = true,
          },
        },
        widget_guides = {
          enabled = true,
        },
        dev_log = {
          open_cmd = "FlutterDevLogOpen",
          focus_on_open = false,
        },
      })

      -- style the dev log window like a snacks terminal split: no gutter, no
      -- winbar, no cursorline
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "log",
        group = vim.api.nvim_create_augroup("FlutterDevLogStyle", { clear = true }),
        callback = function(args)
          if not vim.api.nvim_buf_get_name(args.buf):match("__FLUTTER_DEV_LOG__$") then
            return
          end
          vim.wo.number = false
          vim.wo.relativenumber = false
          vim.wo.signcolumn = "no"
          vim.wo.foldcolumn = "0"
          vim.wo.statuscolumn = ""
          vim.wo.cursorline = false
          vim.wo.wrap = false
          vim.wo.winbar = "  Flutter Dev Log"

          vim.api.nvim_create_autocmd("TextChanged", {
            buffer = args.buf,
            callback = function()
              local buf = args.buf
              local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
              local dirty = false
              for i, line in ipairs(lines) do
                local clean = line:gsub("\27%[[%d;]*[%a]", "")
                if clean ~= line then
                  lines[i] = clean
                  dirty = true
                end
              end
              if dirty then
                local modifiable = vim.bo[buf].modifiable
                vim.bo[buf].modifiable = true
                vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
                vim.bo[buf].modifiable = modifiable
              end
            end,
          })
        end,
      })
    end,
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "sidlatau/neotest-dart",
    },
    opts = {
      adapters = {
        ["neotest-dart"] = {
          custom_dart_args = { "--coverage" },
        },
      },
    },
  },
}
