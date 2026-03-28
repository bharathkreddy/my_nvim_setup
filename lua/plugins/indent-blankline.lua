-- ================================================================================================
-- TITLE : indent-blankline.nvim
-- ABOUT : Indent guides for all levels (scope handled by mini.indentscope)
-- LINKS :
--   > github : https://github.com/lukas-reineke/indent-blankline.nvim
-- ================================================================================================

return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			enabled = false, -- mini.indentscope handles active scope
		},
		exclude = {
			filetypes = {
				"help",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"trouble",
				"NvimTree",
				"dashboard",
				"",
			},
		},
	},
}
