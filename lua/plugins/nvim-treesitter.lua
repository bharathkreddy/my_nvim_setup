-- ================================================================================================
-- TITLE : nvim-treesitter
-- ABOUT : Treesitter configurations and abstraction layer for Neovim.
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter
-- ================================================================================================

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	lazy = false,
	config = function()
		-- Install parsers
		require("nvim-treesitter").setup({
			ensure_install = {
				"bash",
				"c",
				"c_sharp",
				"cpp",
				"css",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
				"svelte",
				"typescript",
				"vue",
				"yaml",
			},
			auto_install = true,
		})

		-- Enable highlighting for all filetypes
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})

		-- Incremental selection keymaps
		vim.keymap.set("n", "<CR>", function()
			require("nvim-treesitter.incremental_selection").init_selection()
		end, { desc = "Init Treesitter Selection" })
		vim.keymap.set("x", "<CR>", function()
			require("nvim-treesitter.incremental_selection").node_incremental()
		end, { desc = "Increment Selection" })
		vim.keymap.set("x", "<TAB>", function()
			require("nvim-treesitter.incremental_selection").scope_incremental()
		end, { desc = "Increment Scope" })
		vim.keymap.set("x", "<S-TAB>", function()
			require("nvim-treesitter.incremental_selection").node_decremental()
		end, { desc = "Decrement Selection" })
	end,
}
