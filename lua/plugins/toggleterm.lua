-- ================================================================================================
-- TITLE : toggleterm.nvim
-- ABOUT : Terminal management for Neovim
-- LINKS :
--   > github : https://github.com/akinsho/toggleterm.nvim
-- ================================================================================================

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		-- Use functions to capture the count prefix (e.g., 2<leader>Th opens terminal #2)
		{
			"<leader>Th",
			function()
				local count = vim.v.count1
				vim.cmd(count .. "ToggleTerm direction=horizontal")
			end,
			desc = "Horizontal",
		},
		{
			"<leader>Tv",
			function()
				local count = vim.v.count1
				vim.cmd(count .. "ToggleTerm direction=vertical")
			end,
			desc = "Vertical",
		},
		{
			"<leader>Tf",
			function()
				local count = vim.v.count1
				vim.cmd(count .. "ToggleTerm direction=float")
			end,
			desc = "Float",
		},
		{ "<leader>Ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All" },
		{
			"<leader>Tl",
			function()
				local terms = require("toggleterm.terminal").get_all()
				if #terms == 0 then
					print("No active terminals")
				else
					local lines = { "Active terminals:" }
					for _, t in ipairs(terms) do
						local status = t:is_open() and "visible" or "hidden"
						table.insert(lines, string.format("  #%d [%s] - %s", t.id, status, t.direction))
					end
					print(table.concat(lines, "\n"))
				end
			end,
			desc = "List Terminals",
		},
	},
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<C-\>]],
		direction = "horizontal",
		float_opts = {
			border = "rounded",
			width = 120,
			height = 30,
		},
		shade_terminals = false,
	},
}
