return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {
		default_mappings = true,
		signs = true,
		mappings = {
			set_next = "m,",           -- Set next available lowercase mark
			toggle = "m;",             -- Toggle mark at cursor
			delete_line = "dm-",       -- Delete all marks on line
			delete_buf = "dm<space>",  -- Delete all marks in buffer
			next = "m]",               -- Go to next mark
			prev = "m[",               -- Go to prev mark
			preview = "m:",            -- Preview mark
		},
	},
}
