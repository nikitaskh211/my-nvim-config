-- Neo-Tree Configuration
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",               -- Use the latest stable version
  dependencies = {
    "nvim-lua/plenary.nvim",     -- Required for some functionalities
    "nvim-tree/nvim-web-devicons", -- Icons support
    "MunifTanjim/nui.nvim",      -- UI components
  },
  config = function()
    -- Set up Neo-Tree
    require("neo-tree").setup({
      -- General settings
      close_if_last_window = true, -- Close Neo-Tree if it's the last window
      popup_border_style = "rounded", -- Rounded borders for popups
      enable_git_status = true,    -- Show Git status indicators
      enable_diagnostics = true,   -- Show diagnostic (LSP) indicators

      -- Filesystem settings
      filesystem = {
        filtered_items = {
          visible = true,                   -- Make all items visible by default
          hide_dotfiles = false,            -- Show dotfiles
          hide_gitignored = false,          -- Show files ignored by Git
          hide_by_name = {},                -- Hide specific files/folders
          hide_by_pattern = {},             -- Hide files matching a pattern
          never_show = {},                  -- Never show these files/folders
        },
        follow_current_file = true,         -- Follow the current file in the editor
        hijack_netrw_behavior = "open_default", -- Hijack Netrw behavior
        use_libuv_file_watcher = true,      -- Use libuv for file watching
      },

      -- Window settings
      window = {
        position = "left",      -- Default position: left
        width = 30,             -- Width of the Neo-Tree window
        mappings = {
          ["."] = "toggle_hidden", -- Toggle hidden files/directories
          ["<CR>"] = "open",    -- Open selected item
          ["o"] = "open_split", -- Open selected item in a split
          ["t"] = "open_tabnew", -- Open selected item in a new tab
          ["v"] = "open_vsplit", -- Open selected item in a vertical split
          ["h"] = "close_node", -- Close the selected node
          ["z"] = "close_all_nodes", -- Close all nodes
          ["R"] = "refresh",    -- Refresh the tree
        },
      },

      -- Buffer settings
      buffers = {
        follow_current_file = true, -- Follow the current file in the buffer list
        group_empty_dirs = true, -- Group empty directories
        show_unloaded = true,   -- Show unloaded buffers
      },

      -- Git settings
      git_status = {
        window = {
          position = "float", -- Position for the Git status view
        },
      },
    })

    -- Keybindings
    local keymap = vim.keymap.set

    -- Define opts as a function
    local function opts(description)
      return { desc = description }
    end

    -- Open FileSystem
    keymap("n", "<leader>fs", function()
      require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    end, opts("Toggle FileSystem"))

    -- Open Buffers
    keymap("n", "<leader>b", function()
      require("neo-tree.command").execute({ toggle = true, source = "buffers" })
    end, opts("Toggle Buffers"))

    -- Open Git Status
    keymap("n", "<leader>g", function()
      require("neo-tree.command").execute({ toggle = true, source = "git_status" })
    end, opts("Toggle Git Status"))
  end,
}
