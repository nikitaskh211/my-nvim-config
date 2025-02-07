-- Tree-sitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Ensure parsers are built on installation
  dependencies = {
    "nvim-telescope/telescope.nvim", -- Optional: If you're using Telescope integration
    "JoosepAlviste/nvim-ts-context-commentstring", -- Optional: For context-aware commenting
    "windwp/nvim-autopairs", -- Optional: For autopairs integration
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Languages to install parsers for
      ensure_installed = { "lua", "asm", "fortran", "c", "cpp", "cmake", "llvm", "cuda", "rust" },
      sync_install = false, -- Install languages asynchronously (faster startup)
      auto_install = true, -- Automatically install missing parsers

      -- Syntax highlighting
      highlight = {
        enable = true, -- Enable syntax highlighting
        additional_vim_regex_highlighting = false, -- Disable fallback to Vim regex highlighting
      },

      -- Indentation based on tree-sitter
      indent = {
        enable = true, -- Enable tree-sitter-based indentation
      },

      -- Incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- Start selection
          node_incremental = "grn", -- Expand selection
          scope_incremental = "grc", -- Expand to scope
          node_decremental = "grm", -- Shrink selection
        },
      },

      -- Text objects
      textobjects = {
        enable = true, -- Enable textobject-based motions
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer", -- Select outer function
            ["if"] = "@function.inner", -- Select inner function
            ["ac"] = "@class.outer",   -- Select outer class
            ["ic"] = "@class.inner",   -- Select inner class
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- Track jumps for `:changes` and `<C-o>`/`<C-i>`
          goto_next_start = {
            ["]m"] = "@function.outer", -- Jump to next function start
            ["]]"] = "@class.outer",   -- Jump to next class start
          },
          goto_next_end = {
            ["]M"] = "@function.outer", -- Jump to next function end
            ["]["] = "@class.outer",    -- Jump to next class end
          },
          goto_previous_start = {
            ["[m"] = "@function.outer", -- Jump to previous function start
            ["[["] = "@class.outer",    -- Jump to previous class start
          },
          goto_previous_end = {
            ["[M"] = "@function.outer", -- Jump to previous function end
            ["[]"] = "@class.outer",    -- Jump to previous class end
          },
        },
      },
    })
  end,
}
