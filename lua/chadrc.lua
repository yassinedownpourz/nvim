-- local color = require "lua.colors"
-- local pink = color.colors.pink
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox",
  transparency = true,
  integrations = {
    "blankline",
    "cmp",
    "codeactionmenu",
    "dap",
    "devicons",
    "hop",
    "lsp",
    "markview",
    "mason",
    "notify",
    "nvimtree",
    "rainbowdelimiters",
    "semantic_tokens",
    "todo",
    "whichkey",
  },
  hl_override = {
    NvDashAscii = { fg = "#689D6A", bg = "NONE" },
    NvDashButtons = { fg = "#83A598", bg = "NONE" },
    TelescopeResultsTitle = { fg = "#689D6A", bg = "NONE" },
    TelescopePreviewTitle = { fg = "#689D6A", bg = "NONE" },
    TelescopePromptPrefix = { fg = "#689D6A", bg = "NONE" },
    TelescopePromptTitle = { fg = "#689D6A", bg = "NONE" },
    FloatBorder = { link = "TeleScopeBorder" },
    Comment = {
      italic = true,
    },
    Keyword = {
      italic = true,
    },
    Include = {
      italic = true,
    },
    Repeat = {
      italic = true,
    },
    Conditional = {
      italic = true,
    },
    SpecialChar = {
      italic = true,
    },
    ["@keyword"] = {
      italic = true,
    },
    ["@comment"] = {
      italic = true,
    },
    ["@keyword.return"] = {
      italic = true,
    },
    ["@function"] = {
      bold = false,
    },
    ["@keyword.function"] = {
      bold = true,
    },
    ["@function.name"] = {
      bold = false,
    },
    ["@operator"] = {
      bold = false,
    },
    ["@keyword.operator"] = {
      bold = true,
    },
    ["@constant"] = {
      bold = true,
    },
  },
  -- changed_themes = {
  --   gruvbox = {
  --     base_30 = {
  --       white = "#e2cca9",
  --       darker_black = "#1b1b1b",
  --       black = "#292929",
  --       black2 = "#32302f",
  --       one_bg = "#4d4d4d",
  --       one_bg2 = "#404040",
  --       one_bg3 = "#484442",
  --       grey = "#665c54",
  --       grey_fg = "#806234",
  --       grey_fg2 = "#735F3F",
  --       light_grey = "#8C7A58",
  --       red = "#ea6962",
  --       baby_pink = "#cc241d",
  --       pink = "#d3869b",
  --       line = "#36393a",
  --       green = "#a9b665",
  --       vibrant_green = "#8bba7f",
  --       nord_blue = "#80aa9e",
  --       blue = "#7daea3",
  --       yellow = "#d8a657",
  --       sun = "#fabd2f",
  --       purple = "#d3869b",
  --       dark_purple = "#d3869b",
  --       teal = "#89b482",
  --       orange = "#fe8019",
  --       cyan = "#89b482",
  --       statusline_bg = "#2c2c2c",
  --       lightbg = "#3d3d3d",
  --       pmenu_bg = "#80aa9e",
  --       folder_bg = "#89b482",
  --     },
  --     base_16 = {
  --       base00 = "#1d2021",
  --       base01 = "#4d4d4d",
  --       base02 = "#404040",
  --       base03 = "#484442",
  --       base04 = "#c5b18d",
  --       base05 = "#ebdbb2",
  --       base06 = "#ebdbb2",
  --       base07 = "#fbf1c7",
  --       base08 = "#ea6962",
  --       base09 = "#e78a4e",
  --       base0A = "#d8a657",
  --       base0B = "#a9b665",
  --       base0C = "#89b482",
  --       base0D = "#7daea3",
  --       base0E = "#d3869b",
  --       base0F = "#bd6f3e",
  --     },
  --   },
  -- },
}

M.ui = {
  nvdash = {
    load_on_startup = true,
    header = {
      "             ▄ ▄                     ",
      "         ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄       ",
      "         █ ▄ █▄█ ▄▄▄ █ █▄█ █ █       ",
      "      ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █       ",
      "    ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄    ",
      "    █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄  ",
      "  ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █  ",
      "  █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █  ",
      "      █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█      ",
    },
  },
  statusline = {
    theme = "vscode",
    separator_style = "default",
  },
  tabufline = {
    order = { "buffers", "tabs" },
  },
}

M.lsp = {
  signature = false,
}

M.cheatsheet = {
  excluded_groups = { "_" },
}

M.colorify = {
  enabled = true,
  mode = "virtual",
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

M.term = {
  float = {
    border = "rounded",
    height = 0.5,
    width = 0.58,
    col = 0.2,
    row = 0.2,
  },
  sizes = {},
}
return M
