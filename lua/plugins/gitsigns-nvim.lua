-- ================================================================================================
-- TITLE : gitsigns.nvim
-- LINKS :
--   > github : https://github.com/lewis6991/gitsigns.nvim
-- ABOUT : deep buffer integration for git.
-- ================================================================================================

return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local opts = { buffer = bufnr }

			-- Navigate between hunks
			vim.keymap.set("n", "]h", gs.next_hunk, vim.tbl_extend("force", opts, { desc = "Next Hunk" }))
			vim.keymap.set("n", "[h", gs.prev_hunk, vim.tbl_extend("force", opts, { desc = "Prev Hunk" }))

			-- Stage/unstage hunks without leaving the file
			vim.keymap.set("n", "<leader>gs", gs.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage Hunk" }))
			vim.keymap.set("n", "<leader>gr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset Hunk" }))
			vim.keymap.set("n", "<leader>gS", gs.stage_buffer, vim.tbl_extend("force", opts, { desc = "Stage Buffer" }))
			vim.keymap.set(
				"n",
				"<leader>gu",
				gs.undo_stage_hunk,
				vim.tbl_extend("force", opts, { desc = "Undo Stage Hunk" })
			)

			-- Preview hunk inline
			vim.keymap.set("n", "<leader>gp", gs.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview Hunk" }))

			-- Blame
			vim.keymap.set("n", "<leader>gb", gs.blame_line, vim.tbl_extend("force", opts, { desc = "Blame Line" }))
			vim.keymap.set(
				"n",
				"<leader>gB",
				gs.toggle_current_line_blame,
				vim.tbl_extend("force", opts, { desc = "Toggle Blame" })
			)

			-- Diff against HEAD
			vim.keymap.set("n", "<leader>gd", gs.diffthis, vim.tbl_extend("force", opts, { desc = "Diff This" }))
		end,
	},
}
