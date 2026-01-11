-- ================================================================================================
-- TITLE : render-markdown.nvim
-- ABOUT : Beautiful markdown rendering in Neovim
-- LINKS :
--   > github : https://github.com/MeanderingProgrammer/render-markdown.nvim
-- ================================================================================================

return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown", "md" },
	keys = {
		{ "<leader>mr", function() require("render-markdown").toggle() end, desc = "Toggle Markdown Render" },
	},
	opts = {
		enabled = true,
		render_modes = { "n", "c" },
		heading = {
			enabled = true,
			sign = true,
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
		},
		code = {
			enabled = true,
			sign = true,
			style = "full",
			border = "thin",
			above = "▄",
			below = "▀",
		},
		dash = {
			enabled = true,
			icon = "─",
		},
		bullet = {
			enabled = true,
			icons = { "●", "○", "◆", "◇" },
		},
		checkbox = {
			enabled = true,
			unchecked = { icon = "󰄱 " },
			checked = { icon = "󰱒 " },
		},
		quote = {
			enabled = true,
			icon = "▋",
		},
		pipe_table = {
			enabled = true,
			style = "full",
			border = {
				"┌", "┬", "┐",
				"├", "┼", "┤",
				"└", "┴", "┘",
				"│", "─",
			},
		},
		callout = {
			note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
			tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
			important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
			warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
			caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
		},
		link = {
			enabled = true,
			image = "󰥶 ",
			hyperlink = "󰌹 ",
		},
	},
}
