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
  -- vim.keymap.set("n", "<C-t>", function()
  --   require("menu").open "default"
  -- end, {})
  -- vim.keymap.set("n", "<RightMouse>", function()
  --   vim.cmd.exec '"normal! \\<RightMouse>"'
  --
  --   local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  --   require("menu").open(options, { mouse = true })
  -- end, {})

  vim.keymap.set("n", ",,", function()
    local word = vim.fn.expand "<cword>"

    -- If LSP is available, use it
    if #vim.lsp.get_active_clients { bufnr = 0 } > 0 then
      vim.lsp.buf.rename()
      return
    end

    -- Otherwise, provide a better substitute experience
    -- Pre-populate the command line with the word and position cursor
    local cmd = ":%s/\\<" .. word .. "\\>/" .. word
    vim.fn.feedkeys(":" .. cmd, "n")
    -- Move cursor left by length of word to position between the '/'
    vim.fn.feedkeys(string.rep("<Left>", #word), "n")
  end, { noremap = true })
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
  local autocmd = vim.api.nvim_create_autocmd

  autocmd({
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

  autocmd("LspAttach", {
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

  autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      local line = vim.fn.line "'\""
      if
        line > 1
        and line <= vim.fn.line "$"
        and vim.bo.filetype ~= "commit"
        and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
      then
        vim.cmd 'normal! g`"'
      end
    end,
  })
end

local function main()
  vim.opt_local.tabstop = 2
  vim.opt_local.shiftwidth = 2
  vim.opt_local.expandtab = true
  vim.opt_local.autoindent = true
  vim.opt_local.smarttab = true
  set_options()
  set_key_mappings()
  set_highlights()
  set_autocommands()
  vim.notify = require "notify"
  vim.g.indent_blankline_use_treesitter = true
  vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/lua_snippets"
  vim.g.markdown_fenced_languages = {
    "ts=typescript",
  }
  vim.api.nvim_create_autocmd("BufDelete", {
    callback = function()
      local bufs = vim.t.bufs
      if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
        vim.cmd "Nvdash"
      end
    end,
  })
  -- Add Quarto file type detection
  vim.cmd [[
  autocmd BufRead,BufNewFile *.qmd set filetype=quarto
]]

  -- Enable syntax highlighting for Quarto
  vim.cmd "syntax enable"
end

main()
