-- ================================================================================================
-- TITLE : CopilotChat.nvim
-- ABOUT : Chat with GitHub Copilot in Neovim
-- LINKS :
--   > github : https://github.com/CopilotC-Nvim/CopilotChat.nvim
-- ================================================================================================

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	build = "make tiktoken",
	opts = {
		model = "gpt-4o",
		window = {
			layout = "vertical",
			width = 0.4,
		},
		-- Make all open buffers the default context
		selection = function(source)
			local select = require("CopilotChat.select")
			return select.buffers(source)
		end,
	},
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Chat Toggle" },
		{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain" },
		{ "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Review" },
		{ "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix" },
		{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Optimize" },
		{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "Docs" },
		{ "<leader>cT", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }, desc = "Tests" },
		{
			"<leader>cq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffers })
				end
			end,
			desc = "Quick Chat (all buffers)",
		},
		{ "<leader>cm", "<cmd>CopilotChatModels<cr>", desc = "Switch Model" },
	},
}
