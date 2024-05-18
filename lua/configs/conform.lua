local options = {
  formatters_by_ft = {
    -- lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    lua = { "stylua" },
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    python = { "black" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)

-- vim.cmd [[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePre * lua require('conform').format({ async = false, timeout_ms = 1000 })
--   augroup END
-- ]]
