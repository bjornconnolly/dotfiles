-- Bootstrap lazy
require('user/lazy_bootstrap')

require('user/globals')

-- Need to set leader before loading lazy
vim.g.mapleader = ";"

-- Load Plugins using Lazy including lua/plugins/*
require('lazy').setup('plugins', {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

-- User setup, rest og keymaps and other options for neovim
require('user')                  -- loads lua/user/init.lua
require('user/maps')             -- loads lua/user/maps (Keymappings go here)
require('user/options')          -- loads lua/user/options.lua
