return {
  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      Colors = require("catppuccin.palettes").get_palette("mocha")
      require("catppuccin").setup({
        custom_highlights = function(Colors)
          return {
            -- VertSplit = { fg = Colors.overlay0 },
            EndOfBuffer = { fg = Colors.overlay0 },
          }
        end,
      })
    end,
  },
}
