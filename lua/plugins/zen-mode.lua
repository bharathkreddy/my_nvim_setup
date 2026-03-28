-- ================================================================================================
-- TITLE : zen-mode.nvim
-- ABOUT : Distraction-free coding
-- LINKS :
--   > github : https://github.com/folke/zen-mode.nvim
-- ================================================================================================

return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
	},
	opts = {
		window = {
			backdrop = 0.95,
			width = 120,
			height = 1,
			options = {
				signcolumn = "no",
				number = false,
				relativenumber = false,
				cursorline = false,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
				laststatus = 0,
			},
			twilight = { enabled = false },
			gitsigns = { enabled = false },
			tmux = { enabled = false },
		},
	},
}
