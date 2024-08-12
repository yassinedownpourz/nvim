vim.wo.relativenumber = true
vim.opt.updatetime = 200
vim.o.ignorecase = true
vim.o.smartcase = true
vim.notify = require("notify")
vim.o.pumblend = 0
vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#689D6A", italic = false, bold = true, })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#4b4b4b" })
vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = "#689D6A" })
vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = "#689D6A" })
vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#689D6A" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#689D6A" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#689D6A" })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#b8bb26" })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#fabd2f" })
vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})
-- Toggle Tabufline
vim.keymap.set("n", "<leader>bb", function()
  vim.o.showtabline = 2 - vim.o.showtabline
  local state = vim.o.showtabline == 2 and "On" or "Off"
  vim.notify("Toggled " .. state, vim.log.levels.INFO, { title = "Tabufline" })
end, { desc = "Options | Toggle Tabufline", silent = true })
