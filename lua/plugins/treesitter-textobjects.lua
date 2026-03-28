-- ================================================================================================
-- TITLE : nvim-treesitter-textobjects
-- ABOUT : Syntax-aware text objects, select, move, and swap support
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- NOTE  : Text objects (af/if/ac/ic/aa/ia) appear in which-key via operator/visual mode
--         Movement keys (]m/[m/]M/[M) registered in which-key bracket motions
-- ================================================================================================

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = { query = "@function.outer", desc = "Around function" },
					["if"] = { query = "@function.inner", desc = "Inside function" },
					["ac"] = { query = "@class.outer", desc = "Around class" },
					["ic"] = { query = "@class.inner", desc = "Inside class" },
					["aa"] = { query = "@parameter.outer", desc = "Around argument" },
					["ia"] = { query = "@parameter.inner", desc = "Inside argument" },
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]m"] = { query = "@function.outer", desc = "Next function start" },
				},
				goto_previous_start = {
					["[m"] = { query = "@function.outer", desc = "Prev function start" },
				},
				goto_next_end = {
					["]M"] = { query = "@function.outer", desc = "Next function end" },
				},
				goto_previous_end = {
					["[M"] = { query = "@function.outer", desc = "Prev function end" },
				},
			},
		})
	end,
}
