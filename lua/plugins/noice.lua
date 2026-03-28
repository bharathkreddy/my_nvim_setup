-- ================================================================================================
-- TITLE : noice.nvim
-- ABOUT : Modern UI for cmdline, messages, popupmenu, and notifications
-- LINKS :
--   > github : https://github.com/folke/noice.nvim
-- ================================================================================================

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
		},
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
		},
		popupmenu = {
			enabled = true,
			backend = "nui",
		},
		lsp = {
			progress = {
				enabled = true,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = false, -- lspsaga handles hover
			},
			signature = {
				enabled = false, -- lsp-signature.nvim handles this
			},
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
	},
	keys = {
		{ "<leader>nl", function() require("noice").cmd("last") end, desc = "Last Notification" },
		{ "<leader>nh", function() require("noice").cmd("history") end, desc = "Notification History" },
		{ "<leader>na", function() require("noice").cmd("all") end, desc = "All Notifications" },
		{ "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss Notifications" },
	},
}
