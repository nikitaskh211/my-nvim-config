-- Tree-sitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":tsupdate",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "asm", "fortran", "c", "cpp", "cmake", "llvm", "cuda", "rust" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      textobjects = {
        enable = true,
      },
    })
  end
}
