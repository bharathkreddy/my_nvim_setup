-- ================================================================================================
-- TITLE : fzf-lua
-- LINKS :
--   > github : https://github.com/ibhagwan/fzf-lua
-- ABOUT : lua-based fzf wrapper and integration.
-- ================================================================================================

return {
	"ibhagwan/fzf-lua",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Files" },
		{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live Grep" },
		{ "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "Help Tags" },
		{ "<leader>fx", function() require("fzf-lua").diagnostics_document() end, desc = "Document Diagnostics" },
		{ "<leader>fX", function() require("fzf-lua").diagnostics_workspace() end, desc = "Workspace Diagnostics" },
	},

	opts = {},
}
