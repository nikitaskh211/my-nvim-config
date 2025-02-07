-- Telescope
return {
  {
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-fzf-native.nvim", -- Add this line
    cmd = "Telescope",                        -- Lazy load on Telescope command
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")

      -- Set up Telescope
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" }, -- Ignore specific directories
          layout_strategy = "horizontal",               -- Change layout strategy
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.5,
            },
          },
          sorting_strategy = "ascending", -- Sort results alphabetically
          winblend = 10,             -- Transparency level
          preview = {
            treesitter = true,       -- Enable Treesitter-based previews
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {}, -- Enable the fzf extension
        },
      })

      -- Load extensions
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf") -- Load the fzf extension

      -- Keybindings
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
  },
}
