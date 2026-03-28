-- ================================================================================================
-- TITLE : nvim-treesitter
-- ABOUT : Treesitter configurations and abstraction layer for Neovim.
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter
-- NOTE  : nvim-treesitter 1.0+ has a new API - highlighting is now built into Neovim
-- ================================================================================================

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		-- Install parsers on startup
		require("nvim-treesitter").install({
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
		})

		-- Enable highlighting and buffer-local selection keymaps
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				pcall(vim.treesitter.start)

				vim.keymap.set("n", "<CR>", function()
					local node = vim.treesitter.get_node()
					if node then
						local sr, sc, er, ec = node:range()
						vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
						vim.cmd("normal! v")
						vim.api.nvim_win_set_cursor(0, { er + 1, ec - 1 })
					end
				end, { buffer = ev.buf, desc = "Init Treesitter Selection" })

				vim.keymap.set("x", "<CR>", function()
					local node = vim.treesitter.get_node()
					if node then
						local parent = node:parent()
						if parent then
							local sr, sc, er, ec = parent:range()
							vim.cmd("normal! \27")
							vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
							vim.cmd("normal! v")
							vim.api.nvim_win_set_cursor(0, { er + 1, ec - 1 })
						end
					end
				end, { buffer = ev.buf, desc = "Increment Selection" })

				vim.keymap.set("x", "<S-TAB>", function()
					local node = vim.treesitter.get_node()
					if node then
						local child = node:child(0)
						if child then
							local sr, sc, er, ec = child:range()
							vim.cmd("normal! \27")
							vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
							vim.cmd("normal! v")
							vim.api.nvim_win_set_cursor(0, { er + 1, ec - 1 })
						end
					end
				end, { buffer = ev.buf, desc = "Decrement Selection" })
			end,
		})
	end,
}
