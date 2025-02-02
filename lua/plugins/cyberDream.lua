-- Colorscheme
return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			borderless_telescope = false,
			terminal_colors = true,
			cache = false,
			theme = {
				variant = "default",
				saturation = 1,
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
