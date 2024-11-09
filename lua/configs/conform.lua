local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "alejandra" },
    css = { "prettierd" },
    html = { "prettierd", "rustywind" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    javascript = { "prettierd", "rustywind " },
    typescript = { "prettierd", "rustywind " },
    javascriptreact = { "prettierd", "rustywind " },
    typescriptreact = { "prettierd", "rustywind" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    php = { "pint", "php_cs_fixer", "rustywind", "larastan" },
    blade = { "blade-formatter", "rustywind" },
    java = { "clang_format" },
    -- python = { "black" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 2500,
  },
}

return options
