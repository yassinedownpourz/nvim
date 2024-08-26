local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "stylua",
        "php-cs-fixer",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "php",
      "html",
      "xml",
      "xsl",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "cpp",
        -- "rust",
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
      }
      return opts
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    event = "InsertEnter",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      local opts = require("custom.configs.copilot").opts
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
        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },
  {
    "gelguy/wilder.nvim",
  },
  {
    "romgrk/fzy-lua-native",
  },
  {
    "rmagatti/auto-session",
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    lazy = true,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
  },
  {
    "wfxr/minimap.vim",
    lazy = true,
    cmd = {
      "Minimap",
      "MinimapClose",
      "MinimapToggle",
      "MinimapRefresh",
      "MinimapUpdateHighlight"
    },
  },
  {
    "rcarriga/nvim-notify",
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
      -- { "<leader><Tab>", ":Neotree toggle left<CR>",  silent = true, desc = "Left File Explorer" },
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_modified_markers = true,
        enable_diagnostics = true,
        sort_case_insensitive = true,
        default_component_configs = {
          indent = {
            with_markers = true,
            with_expanders = true,
          },
          modified = {
            symbol = "  ",
            highlight = "NeoTreeModified",
          },
          {
            --      folder = {
            --   default = "",
            --   empty = "",
            --   empty_open = "",
            --   open = "",
            --   open = "",
            --   symlink = "",
            --   symlink_open = "",
            --   arrow_open = "",
            --   arrow_closed = "",
            -- },
            -- git = {
            --   unstaged = "✗",
            --   staged = "✓",
            --   unmerged = "",
            --   renamed = "➜",
            --   untracked = "★",
            --   deleted = "",
            --   ignored = "◌",
            -- },
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
          },
          git_status = {
            symbols = {
              added = "  ",
              deleted = "  ",
              modified = "  ",
              renamed = "  ",
              untracked = "  ",
              ignored = "  ",
              unstaged = "  ",
              staged = "  ",
              conflict = "  ",
            },
          },
        },
        window = {
          position = "float",
          width = 35,
        },
        filesystem = {
          use_libuv_file_watcher = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules",
            },
            never_show = {
            },
          },
        },
        source_selector = {
          winbar = false,
          sources = {
            { source = "filesystem", display_name = "   Files " },
            { source = "buffers", display_name = "   Bufs " },
            { source = "git_status", display_name = "   Git " },
          },
        },
        event_handlers = {
          {
            event = "neo_tree_window_after_open",
            handler = function(args)
              if args.position == "left" or args.position == "right" then
                vim.cmd("wincmd =")
              end
            end,
          },
          {
            event = "neo_tree_window_after_close",
            handler = function(args)
              if args.position == "left" or args.position == "right" then
                vim.cmd("wincmd =")
              end
            end,
          },
        },
      })
    end,
  },
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },
  {
    "stevearc/dressing.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
      require("dressing").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        stop_eof = true,
        easing_function = "sine",
        hide_cursor = true,
        cursor_scrolls_alone = true,
      })
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    keys = {
      {
        "<leader>Rr",
        function()
          require("spectre").open()
        end,
        desc = "Replace",
      },
      {
        "<leader>Rw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Replace Word",
      },
      {
        "<leader>Rf",
        function()
          require("spectre").open_file_search()
        end,
        desc = "Replace Buffer",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs({ "f", "F", "t", "T" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  -- {
  -- "danymat/neogen",
  -- dependencies = {
  --   "nvim-treesitter/nvim-treesitter",
  --   "L3MON4D3/LuaSnip",
  -- },
  -- config = function()
  --   local neogen = require("neogen")
  --
  --   neogen.setup({
  --     snippet_engine = "luasnip",
  --   })
  -- end,
  -- keys = {
  --   {
  --     "<leader>ng",
  --     function()
  --       require("neogen").generate()
  --     end,
  --     desc = "Generate code annotations",
  --   },
  --   {
  --     "<leader>nf",
  --     function()
  --       require("neogen").generate({ type = "func" })
  --     end,
  --     desc = "Generate Function Annotation",
  --   },
  --   {
  --     "<leader>nt",
  --     function()
  --       require("neogen").generate({ type = "type" })
  --     end,
  --     desc = "Generate Type Annotation",
  --   },
  -- }
  -- },

  {
    "echasnovski/mini.nvim",
    version = "*",
  },
}
return plugins
