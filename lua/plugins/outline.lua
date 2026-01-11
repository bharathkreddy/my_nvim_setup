-- ================================================================================================
-- TITLE : outline.nvim
-- ABOUT : Code outline sidebar showing symbols
-- LINKS :
--   > github : https://github.com/hedyhli/outline.nvim
-- ================================================================================================

return {
	"hedyhli/outline.nvim",
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>lo", "<cmd>Outline<cr>", desc = "Toggle Code Outline" },
		{ "<leader>lO", "<cmd>OutlineOpen<cr>", desc = "Open Code Outline" },
	},
	opts = {
		outline_window = {
			position = "right",
			width = 30,
			relative_width = false,
			auto_close = false,
			auto_jump = false,
			show_numbers = false,
			show_relative_numbers = false,
			wrap = false,
		},
		outline_items = {
			show_symbol_details = true,
			show_symbol_lineno = true,
		},
		symbol_folding = {
			autofold_depth = 1,
			auto_unfold_hover = true,
		},
		preview_window = {
			auto_preview = true,
			border = "rounded",
		},
		keymaps = {
			show_help = "?",
			close = { "<Esc>", "q" },
			goto_location = "<CR>",
			peek_location = "o",
			goto_and_close = "<S-CR>",
			restore_location = "<C-g>",
			hover_symbol = "<C-space>",
			toggle_preview = "K",
			rename_symbol = "r",
			code_actions = "a",
			fold = "h",
			unfold = "l",
			fold_toggle = "<Tab>",
			fold_toggle_all = "<S-Tab>",
			fold_all = "W",
			unfold_all = "E",
			fold_reset = "R",
		},
	},
}
