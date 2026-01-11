-- ================================================================================================
-- TITLE : oil.nvim
-- ABOUT : Edit filesystem like a buffer
-- LINKS :
--   > github : https://github.com/stevearc/oil.nvim
-- ================================================================================================

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open Parent Directory (Oil)" },
		{ "<leader>-", function() require("oil").toggle_float() end, desc = "Oil Float" },
	},
	opts = {
		default_file_explorer = false, -- Keep nvim-tree as default, use Oil when needed
		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		},
		view_options = {
			show_hidden = true,
			is_hidden_file = function(name, _)
				return vim.startswith(name, ".")
			end,
		},
		float = {
			padding = 2,
			max_width = 100,
			max_height = 30,
			border = "rounded",
		},
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-v>"] = "actions.select_vsplit",
			["<C-s>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-r>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
	},
}
