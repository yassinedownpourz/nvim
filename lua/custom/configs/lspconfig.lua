local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
capabilities.offsetEncoding = { "utf-16" }

local lspconfig = require("lspconfig")
local servers = {
  "tsserver",
  "tailwindcss",
  "eslint",
  "clangd",
  "intelephense",
  -- "ruff",
  "emmet_language_server",
  "cssls",
  "nil_ls",
  -- "jedi_language_server",
  "pylyzer",
}

-- lua-ls
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      hint = { enable = true },
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
}
-- tsserver
local inlayHints = {
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}
lspconfig.tsserver.setup {
  settings = {
    typescript = {
      inlayHints = inlayHints,
    },
    javascript = {
      inlayHints = inlayHints,
    },
  },
}

--eslint
lspconfig.eslint.setup {}

--clangd
lspconfig.clangd.setup({
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

-- pylyzer
lspconfig.pylyzer.setup {
  settings = {
    python = {
      checkOnType = true,
      diagnostics = true,
      inlayHints = true,
      smartCompletion = true
    }
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
