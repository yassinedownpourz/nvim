-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "nil_ls",
  "html",
  "cssls",
  "clangd",
  "docker_compose_language_service",
  "spectral",
  "emmet_language_server",
  -- "intelephense",
  "jdtls",
  "basedpyright",
  "denols",
}
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- emmet_language_server
lspconfig.emmet_language_server.setup {
  filetypes = {
    "html",
    "css",
    "xml",
    "blade",
    "typescriptreact",
    "javascriptreact",
    "php",
  },
}

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
lspconfig.basedpyright.setup {
  settings = {
    basedpyright = {
      disableOrganizeImports = false,
      typeCheckingMode = "standard",
      analysis = {
        diagnosticMode = "openFilesOnly",
        inlayHints = {
          callArgumentNames = "all",
          functionReturnTypes = true,
          pytestParameters = true,
          variableTypes = true,
        },
        autoFormatStrings = true,
      },
      linting = { enabled = true },
    },
  },
}

-- jdtls
lspconfig.jdtls.setup {
  settings = {
    java = {
      inlayHints = {
        parameterNames = {
          enabled = "all",
          exclusions = { "this" },
        },
      },
    },
  },
}

-- tsserver
local typescript_tools = require "typescript-tools"
typescript_tools.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
}

-- deno
lspconfig.denols.setup {
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

-- tailwindcss
lspconfig.tailwindcss.setup {
  filetypes = { "typescriptreact" },
  flags = { debounce_text_changes = 300 },
  root_dir = lspconfig.util.root_pattern "tailwind.config.js",
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "(?:class:[\\s\\n]*|class=)['\"]([^'\"]+)['\"]",
        },
      },
    },
  },
}

-- phpactor
-- lspconfig.phpactor.setup {
--   init_options = {
--     ["language_server_phpstan.enabled"] = true,
--     ["language_server_worse_reflection.inlay_hints.enable"] = true,
--     ["language_server_worse_reflection.inlay_hints.params"] = true,
--     ["language_server_worse_reflection.inlay_hints.types"] = true,
--     ["language_server_worse_reflection.diagnostics.enable"] = false,
--   },
-- }

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

-- haskell
lspconfig.hls.setup {
  settings = {
    haskell = {
      plugin = {
        ghcide = {
          codeLens = {
            globalOn = true,
          },
        },
      },
    },
  },
}

-- intelephense
-- lspconfig.intelephense.setup {
--   init_options = {
--     licenceKey = os.getenv "INTELEPHENSE_LICENSE_KEY ",
--   },
-- }
