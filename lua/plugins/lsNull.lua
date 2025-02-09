-- FLS (Formatting Language Server)
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua, -- Lua formatter
				null_ls.builtins.formatting.asmfmt, -- Assembly formatter
				null_ls.builtins.formatting.findent, -- Fortran formatter
				null_ls.builtins.formatting.clang_format, -- C/C++ formatter
				null_ls.builtins.formatting.cmakelang, -- CMake formatter
				null_ls.builtins.formatting.rustfmt, -- Rust formatter

				-- Diagnostics (Linters)
				null_ls.builtins.diagnostics.cmakelint, -- CMake linter
			},
		})

		-- Keybinding for formatting
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format File" })
	end,
}
