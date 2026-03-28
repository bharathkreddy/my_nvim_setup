-- ================================================================================================
-- TITLE : ccc.nvim
-- LINKS :
--   > github : https://github.com/uga-rosa/ccc.nvim
-- ABOUT : colour picker & highlighter for neovim
-- ================================================================================================

return {
	"uga-rosa/ccc.nvim",
	cmd = { "CccPick", "CccConvert", "CccHighlighterToggle" },
	event = "BufReadPre",
	config = function()
		require("ccc").setup({
			highlighter = {
				auto_enable = true, -- enable highlight automatically
				lsp = true, -- highlight colors from LSP too
			},
			highlight_mode = "virtual", -- small circles with colour next to the declaration
		})
	end,
}
