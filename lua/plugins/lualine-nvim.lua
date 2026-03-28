-- ================================================================================================
-- TITLE : lualine.nvim
-- LINKS :
--   > github : https://github.com/nvim-lualine/lualine.nvim
-- ABOUT : A blazing fast and easy to configure Neovim statusline written in Lua.
-- ================================================================================================

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local function macro_recording()
			local reg = vim.fn.reg_recording()
			if reg ~= "" then
				return "recording @" .. reg
			end
			return ""
		end

		local function lsp_server_name()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return ""
			end
			local names = {}
			for _, client in ipairs(clients) do
				table.insert(names, client.name)
			end
			return " " .. table.concat(names, ", ")
		end

		local function copilot_status()
			local clients = vim.lsp.get_clients({ bufnr = 0, name = "copilot" })
			if #clients > 0 then
				return " "
			end
			return ""
		end

		local function search_count()
			if vim.v.hlsearch == 0 then
				return ""
			end
			local ok, result = pcall(vim.fn.searchcount, { maxcount = 999 })
			if not ok or result.total == 0 then
				return ""
			end
			return string.format(" %d/%d", result.current, result.total)
		end

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
					},
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
					},
					{ lsp_server_name },
					{ copilot_status },
				},
				lualine_x = {
					{ macro_recording, color = { fg = "#f38ba8" } },
					{ search_count },
					"encoding",
					{
						"fileformat",
						symbols = { unix = "", dos = "", mac = "" },
					},
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
