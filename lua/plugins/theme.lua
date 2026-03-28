-- ================================================================================================
-- TITLE : Theme Configuration
-- ABOUT : Catppuccin as default theme with nightfox available as alternative
-- LINKS :
--   > catppuccin : https://github.com/catppuccin/nvim
--   > nightfox   : https://github.com/EdenEast/nightfox.nvim
-- ================================================================================================

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					mini = true,
					fidget = true,
					flash = true,
					harpoon = true,
					lsp_saga = true,
					mason = true,
					neotest = true,
					notify = true,
					noice = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					which_key = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
	-- Nightfox available as alternative: :colorscheme duskfox
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		config = function()
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
		end,
	},
}
