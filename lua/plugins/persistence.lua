-- ================================================================================================
-- TITLE : persistence.nvim
-- ABOUT : Session management - under Session group (<leader>S)
-- LINKS :
--   > github : https://github.com/folke/persistence.nvim
-- ================================================================================================

return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{ "<leader>Ss", function() require("persistence").load() end, desc = "Restore Session" },
		{ "<leader>Sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
		{ "<leader>Sd", function() require("persistence").stop() end, desc = "Don't Save Session" },
	},
	opts = {},
}
