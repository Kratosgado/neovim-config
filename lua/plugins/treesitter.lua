return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "mermaid",

        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",

        "python",
        "vue",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "kotlin",
        "java",
        "c",
        "rust",
        "groovy",
      },
    },
  },
}
