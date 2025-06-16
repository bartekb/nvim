local lspconfig = require "lspconfig"

-- Lua LSP
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

-- TypeScript
lspconfig.ts_ls.setup {}

-- Ruby LSP (no rubocop or formatting)
lspconfig.ruby_lsp.setup {
  init_options = {
    enabledFeatures = {
      documentFormatting = false,
      diagnostics = false,
    },
  },
}

-- Uncomment if needed:
-- lspconfig.gopls.setup {}
-- lspconfig.pyright.setup {}
-- lspconfig.rust_analyzer.setup {}
