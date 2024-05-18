-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "glsl_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

-- clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "clangd"},
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_dir = lspconfig.util.root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),
  single_file_support = true,
}

-- c#
lspconfig.omnisharp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  filetypes = { "cs", "vb" },
  root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
}

-- python
lspconfig.pylsp.setup{
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_dir = function(fname)
    return lspconfig.util.root_pattern(
      'pyproject.toml',
      'setup.py',
      'setup.cfg',
      'requirements.txt',
      'Pipfile',
      '.git'
    )(fname) or lspconfig.util.path.dirname(fname)
  end,
  settings = {
    pylsp = {
      plugins = {
        pylsp_mypy = {
          enabled = true,
        },
        pylsp_black = {
          enabled = true,
        },
        pylsp_isort = {
          enabled = true,
        },
        pylint = {
          enabled = true,
          args = {"--disable=C0111"} -- Example argument to disable a specific pylint warning
        },
      },
    },
  },
}
