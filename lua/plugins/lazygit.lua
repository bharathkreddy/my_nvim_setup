return {
	"kdheepak/lazygit.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		{ "<leader>gf", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit File History" },
	},
}
