return {
    keymap = { preset = 'super-tab' },
    cmdline = { enabled = false },
    fuzzy = { implementation = "prefer_rust" },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },
    sources = {
        default = { 'lsp', 'path', 'buffer' },
    },
}
