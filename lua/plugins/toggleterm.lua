-- ================================================================================================
-- TITLE : toggleterm.nvim
-- ABOUT : Terminal management for Neovim
-- LINKS :
--   > github : https://github.com/akinsho/toggleterm.nvim
-- ================================================================================================

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>Th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal" },
		{ "<leader>Tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical" },
		{ "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
		{ "<leader>Ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All" },
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
