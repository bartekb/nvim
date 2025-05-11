return {
    format_on_save = {
        timeout_ms = 2000,
        enable = true,
        lsp_format = 'fallback',
    },
    formatters_by_ft = {
        css = { 'prettierd', 'prettier' },
        html = { 'prettierd', 'prettier' },
        htmlangular = { 'prettierd', 'prettier' },
        json = { 'prettierd', 'prettier' },
        -- eruby = { 'prettierd', 'prettier' },
        scss = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        lua = { 'stylua' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'goimports', 'gofumpt' }, -- gofmt, gomodifytags
    },
}
