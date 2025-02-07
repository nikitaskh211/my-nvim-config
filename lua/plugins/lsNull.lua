-- FLS (Formatting Language Server)
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,   -- Lua formatter
        null_ls.builtins.formatting.asmfmt,   -- Assembly formatter
        null_ls.builtins.formatting.findent,  -- Fortran formatter
        null_ls.builtins.formatting.clang_format, -- C/C++ formatter
        null_ls.builtins.formatting.rustywind, -- Tailwind CSS class sorter
        null_ls.builtins.formatting.rustyfmt,
      },
    })
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, {})
  end,
}
