return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- Ensure format on save is triggered
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "editorconfig/editorconfig-vim",
    event = "BufReadPre",
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier", "clangd", "clang-format", "black",
        "glslls", "glsl_analyzer",
      },
    },
  },
}
