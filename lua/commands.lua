-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
  local current_value = vim.diagnostic.config().virtual_text
  vim.diagnostic.config { virtual_text = not current_value }
end, {})

-- Command to toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
  local current_value = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not current_value)
end, {})
