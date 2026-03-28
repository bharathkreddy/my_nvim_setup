-- ================================================================================================
-- TITLE : fzf-lua
-- ABOUT : Lua-based fzf wrapper and integration - Find files/text ONLY
-- LINKS :
--   > github : https://github.com/ibhagwan/fzf-lua
-- NOTE  : LSP symbols moved to <leader>l group in utils/lsp.lua
-- ================================================================================================

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Files" },
		{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live Grep" },
		{ "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "Help Tags" },
		{ "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent Files" },
		{ "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Grep Word" },
		{ "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = "Grep WORD" },
		{ "<leader>fd", function() require("fzf-lua").diagnostics_document() end, desc = "Diagnostics (Document)" },
		{ "<leader>fD", function() require("fzf-lua").diagnostics_workspace() end, desc = "Diagnostics (Workspace)" },
	},

	opts = {},
}
