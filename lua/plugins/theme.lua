-- ================================================================================================
-- TITLE : theme
-- ABOUT : Nightfox (duskfox) colorscheme with transparent background.
-- LINKS :
--   > nightfox : https://github.com/EdenEast/nightfox.nvim
--   > transparent : https://github.com/xiyaowong/nvim-transparent
-- ================================================================================================

return {
	{
		"xiyaowong/nvim-transparent",
		lazy = false,
		priority = 999,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 999,
		config = function()
			-- load duskfox palette
			local palette = require("nightfox.palette").load("duskfox")

			require("nightfox").setup({
				options = {
					transparent = true,
				},
				groups = {
					duskfox = {
						Visual = { bg = palette.bg1 },
					},
				},
			})

			vim.cmd("colorscheme duskfox")
		end,
	},
}
