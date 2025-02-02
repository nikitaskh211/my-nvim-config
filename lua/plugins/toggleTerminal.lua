-- Toggle terminal
return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_terminals = false,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = "pwsh",
			float_opts = {
				border = "curved",
				highlights = {
					border = "ToggleTermBorder",
					background = "ToggleTermBackground",
				},
			},
		})
		vim.cmd([[highlight ToggleTermFloat guibg=none ctermbg=none]])
		vim.cmd([[highlight ToggleTermBorder guibg=none ctermbg=none]])
	end,
}
