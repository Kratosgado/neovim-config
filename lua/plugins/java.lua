return {
  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    dependencies = {
      "mfussenegger/nvim-jdtls", -- or nvim-java, nvim-lspconfig
      "ibhagwan/fzf-lua", -- 可选，用于符号选择等UI功能。也可以使用其他选择器（例如 telescope.nvim）。
    },
    ---@type bootls.Config
    opts = {},
  },
}
