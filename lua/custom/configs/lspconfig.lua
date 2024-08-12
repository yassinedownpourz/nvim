local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
capabilities.offsetEncoding = { "utf-16" }

require("lspconfig").eslint.setup {}

local lspconfig = require("lspconfig")
local servers = {
  "tsserver",
  "tailwindcss",
  "eslint",
  "clangd",
  "intelephense",
  "ruff",
  "emmet_language_server",
  "cssls",
  "nil_ls",
  "jedi_language_server",
}
require("lspconfig").clangd.setup({
  settings = {
    clangd = {
      InlayHints = {
        Designators = true,
        Enabled = true,
        ParameterNames = true,
        DeducedTypes = true,
      },
      fallbackFlags = { "-std=c++20" },
    },
  }
})
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
