-- ================================================================================================
-- TITLE : GitHub Copilot
-- LINKS :
--   > github : https://github.com/zbirenbaum/copilot.lua
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
						accept = false,             -- Tab to accept full suggestion (via cmp)
						accept_word = "<C-Right>",  -- Ctrl+Right to accept word
						accept_line = "<C-Down>",   -- Ctrl+Down to accept line
						next = "<M-]>",             -- Alt+] next suggestion
						prev = "<M-[>",             -- Alt+[ prev suggestion
						dismiss = "<M-e>",          -- Alt+e dismiss
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
					["*"] = true,
				},
			})
		end,
	},
}
