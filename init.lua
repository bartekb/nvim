require "options"
require "commands"
require "lazy_vim"

local plugins = require "plugins"
require("lazy").setup(plugins, require "lazy_config")

require "mappings"

vim.cmd "colorscheme catppuccin"
