-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.opt
local g = vim.g

-- Disable providers
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
g.lazyvim_python_ruff = "ruff"

-- Setup basic identation and tab expansion (Overwritten per lang later)
o.shiftwidth = 2
o.tabstop = 2 -- how many columns a tab counts for
o.expandtab = true
o.autoindent = true
o.smartindent = true -- make indenting smarter again

-- Show encodings
o.list = true
o.showbreak = "↪"
o.listchars = {
  eol = "¬",
  trail = "⋅",
  extends = "❯",
  precedes = "❮",
  tab = "->",
}

-- Show ruler
--o.ruler = true

-- Disable line wrapping per default
o.wrap = false

-- search settings
o.ignorecase = true
o.smartcase = true
-- o.wildignorecase = true -- When set case is ignored when completing file names and directories
-- o.wildmode = "full"

-- appearance
o.termguicolors = true
o.background = "dark"
o.signcolumn = "no"
o.number = false -- Show a column with line numbers
o.relativenumber = false -- Also disable the relativenumber
-- o.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
--
-- Swapfile and undo
o.swapfile = false -- enable/disable swap file creation
-- o.undodir = fn.stdpath("data") .. "~/tmp/vim/" -- set undo directory
o.undofile = true -- enable/disable undo file creation

o.fillchars = { eob = "~" }

-- Enable showmode in case we are not showing status with lualine
--o.showmode = true
