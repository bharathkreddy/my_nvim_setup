-- ================================================================================================
-- TITLE : nvim-treesitter-context
-- ABOUT : Sticky function/class/block headers at top of window when scrolled past
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter-context
-- ================================================================================================

return {
	"nvim-treesitter/nvim-treesitter-context",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		max_lines = 3,
		trim_scope = "outer",
	},
}
