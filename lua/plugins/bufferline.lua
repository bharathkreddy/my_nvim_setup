return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	keys = {
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin Buffer" },
		{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close Non-Pinned Buffers" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Other Buffers" },
		{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Buffers to Left" },
		{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close Buffers to Right" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
		{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
	},
	opts = {
		options = {
			mode = "buffers",
			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			diagnostics_indicator = function(_, _, diag)
				local icons = { Error = " ", Warn = " ", Hint = "", Info = "" }
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},
}
