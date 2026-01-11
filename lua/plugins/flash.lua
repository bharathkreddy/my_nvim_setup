-- ================================================================================================
-- TITLE : flash.nvim
-- ABOUT : Navigate anywhere with 2-3 keystrokes
-- LINKS :
--   > github : https://github.com/folke/flash.nvim
-- ================================================================================================

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{ "gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	},
	opts = {
		labels = "asdfghjklqwertyuiopzxcvbnm",
		search = {
			multi_window = true,
			forward = true,
			wrap = true,
		},
		jump = {
			jumplist = true,
			pos = "start",
			autojump = false,
		},
		label = {
			uppercase = false,
			rainbow = {
				enabled = true,
				shade = 5,
			},
		},
		modes = {
			char = {
				enabled = true,
				jump_labels = true,
			},
			search = {
				enabled = true,
			},
		},
	},
}
