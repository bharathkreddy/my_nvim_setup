return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
		{ "<leader>tH", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal Horizontal" },
		{ "<leader>tV", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal Vertical" },
		{ "<leader>tF", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Float" },
		{ "<leader>tA", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },
		{ "<leader>gG", function()
			require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", direction = "float" }):toggle()
		end, desc = "LazyGit (Terminal)" },
	},
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<C-\>]],
		direction = "horizontal",
		float_opts = {
			border = "rounded",
			width = 120,
			height = 30,
		},
		shade_terminals = false,
	},
}
