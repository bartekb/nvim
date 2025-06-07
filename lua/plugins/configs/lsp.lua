local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- lspconfig.gopls.setup {}
-- lspconfig.pyright.setup({})
lspconfig.ts_ls.setup {}
lspconfig.ruby_lsp.setup {}
-- lspconfig.rust_analyzer.setup({})
