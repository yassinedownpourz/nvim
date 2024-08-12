local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtins.formatting.stylua,       -- lua formatter
    null_ls.builtins.formatting.prettierd,    -- javascript formatter
    null_ls.builtins.formatting.rustywind,    -- tailwindcss formatter
    null_ls.builtins.formatting.alejandra,    -- nix formatter
    null_ls.builtins.formatting.clang_format, -- c/c++ formatter
    null_ls.builtins.diagnostics.tidy,        -- html/xml formatter
    null_ls.builtins.diagnostics.todo_comments,
    null_ls.builtins.formatting.phpcsfixer,   -- php formatter
    null_ls.builtins.diagnostics.mypy,        -- python diagnostics
    null_ls.builtins.formatting.black,        -- python formatter
    null_ls.builtins.code_actions.gitsigns,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
