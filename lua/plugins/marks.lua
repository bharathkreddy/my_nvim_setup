return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>Ms", desc = "Set Next Mark" },
		{ "<leader>Mt", desc = "Toggle Mark" },
		{ "<leader>Md", desc = "Delete Marks on Line" },
		{ "<leader>MD", desc = "Delete All Marks in Buffer" },
		{ "<leader>Mn", desc = "Next Mark" },
		{ "<leader>Mp", desc = "Prev Mark" },
		{ "<leader>Mv", desc = "Preview Mark" },
		{ "<leader>Ml", desc = "List All Marks" },
	{ "<leader>Ma", desc = "Annotate Mark" },
	},
	opts = {
		default_mappings = false,
		signs = true,
		mappings = {
			set_next = "<leader>Ms",
			toggle = "<leader>Mt",
			delete_line = "<leader>Md",
			delete_buf = "<leader>MD",
			next = "<leader>Mn",
			prev = "<leader>Mp",
			preview = "<leader>Mv",
			annotate = "<leader>Ma",
		},
	},
	config = function(_, opts)
		require("marks").setup(opts)
		-- Add list marks keymap
		vim.keymap.set("n", "<leader>Ml", "<cmd>MarksListAll<cr>", { desc = "List All Marks" })
	end,
}
