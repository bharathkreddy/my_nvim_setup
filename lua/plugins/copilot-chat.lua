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
	},
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat Toggle" },
		{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Copilot Explain" },
		{ "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Copilot Review" },
		{ "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Copilot Fix" },
		{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Copilot Optimize" },
		{ "<leader>cd", "<cmd>CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "Copilot Docs" },
		{ "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }, desc = "Copilot Tests" },
		{ "<leader>cq", function()
			local input = vim.fn.input("Quick Chat: ")
			if input ~= "" then
				require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
			end
		end, desc = "Copilot Quick Chat" },
	},
}
