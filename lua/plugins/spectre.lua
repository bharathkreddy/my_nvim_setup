-- ================================================================================================
-- TITLE : nvim-spectre
-- ABOUT : Search and replace panel - under Refactor group
-- LINKS :
--   > github : https://github.com/nvim-pack/nvim-spectre
-- ================================================================================================

return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>rr", function() require("spectre").toggle() end, desc = "Search & Replace" },
		{ "<leader>rw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Replace Current Word" },
		{ "<leader>rf", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Replace in File" },
	},
}
