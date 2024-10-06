return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "cpp",
        "rust",
        "php",
        "html",
        "css",
        "python",
        "xml",
        "nix",
        "yaml",
        "json",
        "java",
        "markdown",
        "make",
        "cmake",
        "fish",
        "dockerfile",
        "roc",
        "haskell",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        prompt_prefix = "   ",
        layout_config = {
          height = 0.75,
          prompt_position = "top",
          vertical = {
            mirror = true,
            preview_cutoff = 0,
          },
        },
      },
    },
  },

  {
    "gelguy/wilder.nvim",
    config = function()
      local opts = require "plugins.custom.wilder"
      require("wilder").setup(opts)
    end,
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      local opts = require("plugins.custom.auto-session").opts
      require("auto-session").setup(opts)
    end,
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    lazy = true,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local opts = require("plugins.custom.barbecue").opts
      require("barbecue").setup(opts)
    end,
  },

  {
    "wfxr/minimap.vim",
    lazy = true,
    cmd = {
      "Minimap",
      "MinimapClose",
      "MinimapToggle",
      "MinimapRefresh",
      "MinimapUpdateHighlight",
    },
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      local opts = require("plugins.custom.notify").opts
      require("notify").setup(opts)
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    },
    config = function()
      local opts = require("plugins.custom.neo-tree").opts
      require("neo-tree").setup(opts)
    end,
  },

  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  {
    "stevearc/dressing.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("dressing").setup {}
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "ggandor/flit.nvim",
    config = function()
      require("flit").setup {}
    end,
  },

  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  {
    "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│ ",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  {
    "felpafel/inlay-hint.nvim",
    event = "LspAttach",
    config = function()
      local opts = require("plugins.custom.inlay-hint").opts
      require("inlay-hint").setup(opts)
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
    opts = require("plugins.custom.todo-comments").opts,
  },

  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    event = "InsertEnter",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      local opts = require("plugins.custom.copilot").opts
      require("copilot").setup(opts)
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },

  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.ai").setup()
    end,
  },

  -- {
  --   "VidocqH/lsp-lens.nvim",
  --   event = "BufRead",
  --   opts = {
  --     include_declaration = true, -- Reference include declaration
  --     sections = { -- Enable / Disable specific request
  --       definition = true,
  --       references = true,
  --       implementation = true,
  --     },
  --   },
  --   keys = {
  --     {
  --       -- LspLensToggle
  --       "<leader>ls",
  --       "<cmd>LspLensToggle<CR>",
  --       desc = "LSP Len Toggle",
  --     },
  --   },
  -- },
}
