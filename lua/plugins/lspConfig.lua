-- LSP
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "asm_lsp", "fortls", "clangd", "neocmake", "pylsp", "rust_analyzer" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua Language Server
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- Assembly Language Server
      lspconfig.asm_lsp.setup({
        capabilities = capabilities,
      })

      -- Fortran Language Server
      lspconfig.fortls.setup({
        capabilities = capabilities,
      })

      -- Clangd (C/C++ Language Server)
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      -- CMake Language Server
      lspconfig.neocmake.setup({
        capabilities = capabilities,
        settings = {
          cmake = {
            lint = {
              enable = true,
            },
            format = {
              enable = true,
            },
          },
        },
      })

      -- Python Language Server
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })

      -- Rust Analyzer
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })

      -- Keybindings for LSP functionality
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
