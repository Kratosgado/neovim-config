return {
  { "hrsh7th/nvim-cmp", enabled = false },
  { "catppuccin/nvim", enabled = false },
  -- We use mini.files as the explorer. LazyVim auto-enables the neo-tree extra
  -- as the default explorer for install_version < 8 installs, so disable it.
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
}
