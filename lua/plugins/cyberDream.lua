-- Colorscheme
return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- cyberdream.nvim setup
		require("cyberdream").setup({
			-- Transparent background settings
			bg_alt = "none", -- Transparent alternative background
			bg_highlight = "none", -- Transparent highlight background

			-- Foreground and accent colors
			fg = "#f8f8f2", -- Foreground color
			accent = "#ff79c6", -- Accent color

			-- Borderless pickers
			borderless_pickers = true,

			-- Extras (optional)
			extras = {
				virtual_ruler = true, -- Enable virtual ruler
				snacks = { -- Example: Configure snack support
					enable = true,
					colors = {
						text = "#ffffff", -- Snack text color
						background = "none", -- Transparent snack background
					},
				},
			},
		})

		-- Global transparency settings for Neovim
		vim.opt.bg = "dark" -- Set background mode to dark
		vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])
		vim.cmd([[highlight NonText ctermbg=NONE guibg=NONE]])
		vim.cmd([[highlight LineNr ctermbg=NONE guibg=NONE]])
		vim.cmd([[highlight SignColumn ctermbg=NONE guibg=NONE]])
		vim.cmd([[highlight EndOfBuffer ctermbg=NONE guibg=NONE]])

		-- Apply the colorscheme
		vim.cmd("colorscheme cyberdream")
	end,
}
