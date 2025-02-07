-- Toggle terminal
return {
	"akinsho/toggleterm.nvim",
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal

		-- Set up ToggleTerm
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
				width = 120, -- Set a fixed width
				height = 30, -- Set a fixed height
				winblend = 10, -- Add transparency (optional)
				highlights = {
					border = "ToggleTermBorder",
					background = "ToggleTermBackground",
				},
			},
			scroll_buffer = 0, -- Disable scrollback buffer limit
		})

		-- Custom keybindings
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		vim.keymap.set("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle LazyGit" })

		-- Transparent background
		vim.cmd([[highlight ToggleTermFloat guibg=none ctermbg=none]])
		vim.cmd([[highlight ToggleTermBorder guibg=none ctermbg=none]])

		-- Open terminal in current file's directory
		vim.keymap.set("n", "<leader>tt", function()
			local current_dir = vim.fn.expand("%:p:h")
			local term = Terminal:new({ dir = current_dir })
			term:open()
		end, { desc = "Open terminal in current file's directory" })
	end,
}
