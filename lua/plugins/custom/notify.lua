local M = {}

M.opts = {
  stages = "fade_in_slide_out",
  timeout = 3000,
  background_colour = "#282828",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
  max_height = function()
    return math.floor(vim.o.lines * 0.50)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.45)
  end,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { focusable = false })
  end,
}

return M
