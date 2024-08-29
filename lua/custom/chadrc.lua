---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'gruvbox',
  transparency = true,
  statusline = {
    theme = "vscode",
    separator_style = "default",
    overriden_modules = nil,
  },
  telescope = {
    style = "bordered"
  },
  nvdash = {
    load_on_startup = true,
  },
  hl_override = {
    NvDashAscii           = { fg = "#689D6A", bg = "NONE" },
    NvDashButtons         = { fg = "#83A598", bg = "NONE" },
    -- TelescopeBorder            = { fg = "#689D6A", bg = "NONE" },
    -- TelescopePromptBorder      = { fg = "#689D6A", bg = "NONE" },
    TelescopeResultsTitle = { fg = "#689D6A", bg = "NONE" },
    TelescopePreviewTitle = { fg = "#689D6A", bg = "NONE" },
    TelescopePromptPrefix = { fg = "#689D6A", bg = "NONE" },
    TelescopePromptTitle  = { fg = "#689D6A", bg = "NONE" },
    -- IndentBlanklineContextChar = { fg = "#689D6A" },
  },
  ---@diagnostic disable
  changed_themes = {
    gruvbox = {
      base_30 = {
        -- white = "#e2cca9",
        -- darker_black = "#1b1b1b",
        -- black = "#282828", -- nvim bg
        -- black2 = "#32302f",
        -- one_bg = "#3c3836",
        -- one_bg2 = "#423e3c",
        -- one_bg3 = "#484442",
        -- grey = "#665c54",
        -- grey_fg = "#806234",
        -- grey_fg2 = "#735F3F",
        -- light_grey = "#8C7A58",
        -- red = "#f2594b",
        -- baby_pink = "#cc241d",
        -- pink = "#ff75a0",
        -- line = "#36393a", -- for lines like vertsplit
        -- green = "#b0b846",
        -- vibrant_green = "#8bba7f",
        -- nord_blue = "#80aa9e",
        -- blue = "#80aa9e",
        -- yellow = "#e9b143",
        -- sun = "#fabd2f",
        -- purple = "#b4bbc8",
        -- dark_purple = "#d3869b",
        -- teal = "#8bba7f",
        -- orange = "#fe8019",
        -- cyan = "#82b3a8",
        -- statusline_bg = "#2c2c2c",
        -- lightbg = "#3d3d3d",
        -- pmenu_bg = "#80aa9e",
        folder_bg = "#8bba7f",
      },
      base_16 = {
        -- base00 = "#282828", -- remains the same
        -- base01 = "#3c3836", -- remains the same
        -- base02 = "#423e3c", -- remains the same
        -- base03 = "#484442", -- remains the same
        -- base04 = "#c5b18d", -- fg1
        -- base05 = "#ddc7a1", -- fg0
        -- base06 = "#ebdbb2", -- remains the same
        -- base07 = "#fbf1c7", -- remains the same
        -- base08 = "#ea6962", -- red
        -- base09 = "#e78a4e", -- orange
        -- base0A = "#d8a657", -- yellow
        -- base0B = "#a9b665", -- green
        -- base0C = "#89b482", -- aqua
        -- base0D = "#7daea3", -- blue
        -- base0E = "#d3869b", -- purple
        -- base0F = "#bd6f3e", -- dimOrange
      },
    },
  },
}
M.plugins = "custom.plugins"

return M
