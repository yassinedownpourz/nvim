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
    TelescopeResultsTitle = { fg = "#689D6A", bg = "NONE" },
    TelescopePreviewTitle = { fg = "#689D6A", bg = "NONE" },
    TelescopePromptPrefix = { fg = "#689D6A", bg = "NONE" },
    TelescopePromptTitle  = { fg = "#689D6A", bg = "NONE" },
    Comment               = { italic = true },
    ["@comment"]          = { italic = true },
    FloatBorder           = { link = "TeleScopeBorder" },
    NvimTreeRootFolder    = { link = "NvimTreeNormal" },
    Keyword               = { italic = true },
    ["@keyword"]          = { italic = true },
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
    --   gruvbox = {
    --     base_30 = {
    --       white = "#D3C6AA",
    --       darker_black = "#1E2326",
    --       black = "#272E33", -- nvim bg
    --       black2 = "#2E383C",
    --       one_bg = "#374145",
    --       one_bg2 = "#414B50",
    --       one_bg3 = "#4B555A",
    --       grey = "#4F5B58",
    --       grey_fg = "#565C5A",
    --       grey_fg2 = "#5D6560",
    --       light_grey = "#665C54",
    --       red = "#E67E80",
    --       baby_pink = "#E67E80",
    --       pink = "#E67E80",
    --       line = "#374145", -- for lines like vertsplit
    --       green = "#A7C080",
    --       vibrant_green = "#A7C080",
    --       nord_blue = "#7FBBB3",
    --       blue = "#7FBBB3",
    --       yellow = "#DBBC7F",
    --       sun = "#DBBC7F",
    --       purple = "#D699B6",
    --       dark_purple = "#D699B6",
    --       teal = "#83C092",
    --       orange = "#E69875",
    --       cyan = "#83C092",
    --       statusline_bg = "#2E383C",
    --       lightbg = "#374145",
    --       pmenu_bg = "#7FBBB3",
    --       folder_bg = "#83C092",
    --     },
    --     base_16 = {
    --       base00 = "#272E33",
    --       base01 = "#2E383C",
    --       base02 = "#374145",
    --       base03 = "#414B50",
    --       base04 = "#859289",
    --       base05 = "#D3C6AA",
    --       base06 = "#E9E8D2",
    --       base07 = "#FDF6E3",
    --       base08 = "#E67E80", -- red
    --       base09 = "#E69875", -- orange
    --       base0A = "#DBBC7F", -- yellow
    --       base0B = "#A7C080", -- green
    --       base0C = "#83C092", -- aqua/teal
    --       base0D = "#7FBBB3", -- blue
    --       base0E = "#D699B6", -- purple
    --       base0F = "#EAEDC8", -- light yellow/cream
    --     },
    --   },
  },
}
M.plugins = "custom.plugins"

return M
