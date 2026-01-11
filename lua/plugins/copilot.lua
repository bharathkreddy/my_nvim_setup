-- ================================================================================================
-- TITLE : GitHub Copilot
-- LINKS :
--   > github : https://github.com/zbirenbaum/copilot.lua
--   > cmp    : https://github.com/zbirenbaum/copilot-cmp
-- ABOUT : Fully featured Lua replacement for github/copilot.vim
-- ================================================================================================

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = false,             -- Tab to accept full suggestion
						accept_word = "<C-Right>",  -- Ctrl+Right to accept word
						accept_line = "<C-Down>",   -- Ctrl+Down to accept line
						next = "<C-n>",             -- Ctrl+] next suggestion
						prev = "<C-p>",             -- Ctrl+[ prev suggestion
						dismiss = "<C-e>",          -- Ctrl+e dismiss
					},
				},
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<C-CR>",
					},
				},
				filetypes = {
					yaml = true,
					markdown = true,
					gitcommit = true,
					["*"] = true,
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
