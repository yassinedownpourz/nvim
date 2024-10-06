-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "nil_ls",
  "html",
  "cssls",
  "emmet_language_server",
  "clangd",
  "phpactor",
  "docker_compose_language_service",
  "spectral",
  -- "basedpyright",
  -- "jdtls",
}
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- lua-ls
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      hint = { enable = true },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

-- clangd
lspconfig.clangd.setup {
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
  },
}

-- basedpyright
-- lspconfig.basedpyright.setup {
--   settings = {
--     basedpyright = {
--       disableOrganizeImports = true,
--       typeCheckingMode = "standard",
--       analysis = {
--         inlayHints = {
--           callArgumentNames = "all",
--           functionReturnTypes = true,
--           pytestParameters = true,
--           variableTypes = true,
--         },
--         autoFormatStrings = true,
--       },
--       linting = { enabled = true },
--     },
--   },
-- }

-- jdtls
-- lspconfig.jdtls.setup {
--   settings = {
--     java = {
--       inlayHints = {
--         parameterNames = {
--           enabled = "all",
--           exclusions = { "this" },
--         },
--       },
--     },
--   },
-- }

-- tsserver
local inlayHints = {
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = false,
  includeInlayEnumMemberValueHints = true,
}
lspconfig.ts_ls.setup {
  settings = {
    typescript = {
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = inlayHints,
    },
    javascript = {
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = inlayHints,
    },
  },
}

-- phpactor
lspconfig.phpactor.setup {
  init_options = {
    ["language_server.diagnostic_providers"] = {},
    ["language_server_worse_reflection.diagnostics.enable"] = true,
    ["language_server_worse_reflection.inlay_hints.enable"] = true,
    ["language_server_worse_reflection.inlay_hints.params"] = true,
  },
}

-- docker
lspconfig.dockerls.setup {
  settings = {
    docker = {
      languageserver = {
        formatter = {
          ignoreMultilineInstructions = true,
        },
      },
    },
  },
}
