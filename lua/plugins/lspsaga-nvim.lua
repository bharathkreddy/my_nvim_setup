return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			scroll_preview = {
				scroll_down = "<C-j>",
				scroll_up = "<C-k>",
			},
			finder = {
				keys = {
					toggle_or_open = "<CR>",
				},
			},
			definition = {
				keys = {
					edit = "<CR>",
				},
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
