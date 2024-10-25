local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "alejandra" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    php = { "pint", "php_cs_fixer" },
    blade = { "blade-formatter" },
    java = { "clang_format" },
    -- python = { "black" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1500,
  },
}

return options
