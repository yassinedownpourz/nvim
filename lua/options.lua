require "nvchad.options"

local function set_options()
  vim.wo.relativenumber = true
  vim.opt.updatetime = 200
  vim.o.ignorecase = true
  vim.o.smartcase = true
  vim.o.pumblend = 0
  vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  vim.o.cursorlineopt = "both"
end

local function set_key_mappings()
  -- Toogle Tabline
  vim.keymap.set("n", "<leader>bb", function()
    vim.o.showtabline = 2 - vim.o.showtabline
    local state = vim.o.showtabline == 2 and "On" or "Off"
    vim.notify("Toggled " .. state, vim.log.levels.INFO, { title = "Tabufline" })
  end, { desc = "Options | Toggle Tabufline", silent = true })

  -- Volt Menu
  vim.keymap.set("n", "<C-t>", function()
    require("menu").open "default"
  end, {})

  vim.keymap.set("n", "<RightMouse>", function()
    vim.cmd.exec '"normal! \\<RightMouse>"'

    local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
    require("menu").open(options, { mouse = true })
  end, {})
end

local function set_highlights()
  local highlights = {
    { "NeoTreeRootName", { fg = "#689D6A", italic = false } },
    { "NeoTreeFloatBorder", { fg = "#4b4b4b" } },
    { "NeoTreeFloatTitle", { fg = "#689D6A" } },
    { "NeoTreeGitUnstaged", { fg = "#689D6A" } },
    { "NeoTreeTitleBar", { fg = "#689D6A" } },
    { "NeoTreeDirectoryIcon", { fg = "#689D6A" } },
    { "NeoTreeDirectoryName", { fg = "#689D6A" } },
    { "NeoTreeGitUntracked", { fg = "#b8bb26" } },
    { "NeoTreeGitModified", { fg = "#fabd2f" } },
    { "MiniIndentscopeSymbol", { fg = "#e78a4e" } },
    { "CursorLineNR", { fg = "#e78a4e", bg = "none" } },
    { "GitSignsAdd", { bg = "none", fg = "#89b482" } },
    { "GitSignsChange", { bg = "none", fg = "#a9b665" } },
    { "GitSignsDelete", { bg = "none", fg = "#ea6962" } },
    { "DiagnosticSignWarn", { bg = "none", fg = "#D79921" } },
    { "DiagnosticSignError", { bg = "none", fg = "#FB4934" } },
    { "DiagnosticSignInfo", { bg = "none", fg = "#689D6A" } },
    { "DiagnosticSignHint", { bg = "none", fg = "#83A598" } },
    { "NotifyBackground", { bg = "none", fg = "#83A598" } },
    { "TodoBgTODO", { bg = "#e78a4e" } },
    { "TodoFgTODO", { bg = "#32302f" } },
    { "TodoBgNOTE", { bg = "#7daea3" } },
    { "TodoFgNOTE", { bg = "#32302f" } },
    -- { "Type", { fg = "#fabd2f", bold = true } },
  }

  for _, hl in ipairs(highlights) do
    vim.api.nvim_set_hl(0, hl[1], hl[2])
  end
end

local function set_autocommands()
  vim.api.nvim_create_autocmd({
    "WinScrolled",
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

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client ~= nil and client.supports_method "textDocument/inlayHint" then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        vim.keymap.set("n", "<leader>i", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
        end, { buffer = bufnr })
      end
    end,
  })
end

local function main()
  set_options()
  set_key_mappings()
  set_highlights()
  set_autocommands()
  vim.notify = require "notify"
  vim.g.indent_blankline_use_treesitter = true
  vim.g.indentLine_char = "."
end

main()