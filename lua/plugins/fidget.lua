-- ================================================================================================
-- TITLE : fidget.nvim
-- ABOUT : LSP progress notifications
-- LINKS :
--   > github : https://github.com/j-hui/fidget.nvim
-- ================================================================================================

return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	opts = {
		progress = {
			display = {
				render_limit = 5,
				done_ttl = 3,
				done_icon = "✓",
				progress_icon = { pattern = "dots" },
			},
		},
		notification = {
			window = {
				winblend = 0,
				border = "rounded",
				relative = "editor",
			},
		},
	},
}
