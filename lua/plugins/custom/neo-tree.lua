local M = {}

M.opts = {
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
        added = "✚ ",
        deleted = "✖ ",
        modified = "✱ ",
        renamed = "➜ ",
        untracked = "✧ ",
        ignored = "◌ ",
        unstaged = "✦ ",
        staged = "✓ ",
        conflict = "✶ ",
      },
    },
  },
  window = {
    position = "float",
    width = 40,
  },
  filesystem = {
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        "node_modules",
      },
      never_show = {},
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
          vim.cmd "wincmd ="
        end
      end,
    },
    {
      event = "neo_tree_window_after_close",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd "wincmd ="
        end
      end,
    },
  },
}

return M
