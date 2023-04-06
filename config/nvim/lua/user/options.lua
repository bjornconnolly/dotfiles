local fn = vim.fn
local o = vim.opt
local g = vim.g

-- Disable providers
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

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
  eol = '¬',
  trail = '⋅',
  extends = '❯',
  precedes = '❮',
  tab = '->',
}

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
-- o.number = true -- Show a column with line numbers
-- o.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
--
-- Swapfile and undo
o.swapfile = false -- enable/disable swap file creation
o.undodir = fn.stdpath("data") .. "/undodir" -- set undo directory
o.undofile = true -- enable/disable undo file creation
