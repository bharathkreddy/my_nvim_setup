-- ================================================================================================
-- TITLE : gitsigns.nvim
-- LINKS :
--   > github : https://github.com/lewis6991/gitsigns.nvim
-- ABOUT : deep buffer integration for git.
-- ================================================================================================

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "<leader>gs", function() require("gitsigns").stage_hunk() end, desc = "Stage Hunk" },
		{ "<leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Reset Hunk" },
		{ "<leader>gs", function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, mode = "v", desc = "Stage Hunk (Visual)" },
		{ "<leader>gr", function() require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, mode = "v", desc = "Reset Hunk (Visual)" },
		{ "<leader>gS", function() require("gitsigns").stage_buffer() end, desc = "Stage Buffer" },
		{ "<leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Reset Buffer" },
		{ "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview Hunk" },
		{ "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame Line" },
		{ "<leader>gB", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle Line Blame" },
		{ "<leader>gd", function() require("gitsigns").diffthis() end, desc = "Diff This" },
		{ "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next Hunk" },
		{ "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Prev Hunk" },
	},
	opts = {},
}
