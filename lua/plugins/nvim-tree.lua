-- ================================================================================================
-- TITLE : nvim-tree.lua
-- ABOUT : A file explorer tree for Neovim, written in Lua.
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-tree.lua
-- ================================================================================================

return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
	keys = {
		{ "<leader>E", "<Cmd>NvimTreeFocus<CR>", desc = "Focus File Explorer" },
		{ "<leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
	},
	config = function()
		-- Remove background color from the NvimTree window (ui fix)
		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

		require("nvim-tree").setup({
			filters = {
				dotfiles = false, -- Show hidden files (dotfiles)
			},
			view = {
				adaptive_size = true,
			},
		})
	end,
}
