-- ================================================================================================
-- TITLE : which-key
-- ABOUT : WhichKey helps you remember your Neovim keymaps, by showing keybindings as you type.
-- LINKS :
--   > github : https://github.com/folke/which-key.nvim
-- ================================================================================================

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 300,
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Register key groups
		wk.add({
			-- Top level
			{ "<leader>1", hidden = true },
			{ "<leader>2", hidden = true },
			{ "<leader>3", hidden = true },
			{ "<leader>4", hidden = true },

			-- Groups
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Copilot" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>f", group = "Find/FZF" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>n", group = "Notifications" },
			{ "<leader>o", group = "Organize" },
			{ "<leader>q", group = "Session" },
			{ "<leader>r", group = "Rename/Config" },
			{ "<leader>s", group = "Split/Search" },
			{ "<leader>t", group = "Test/Terminal" },
			{ "<leader>x", group = "Trouble/Diagnostics" },

			-- Single keys with descriptions
			{ "<leader>e", desc = "Toggle File Explorer" },
			{ "<leader>m", desc = "Focus File Explorer" },
			{ "<leader>u", desc = "Toggle Undotree" },
			{ "<leader>w", desc = "Save" },
			{ "<leader>q", desc = "Quit" },
			{ "<leader>?", desc = "Buffer Keymaps" },

			-- Bracket motions
			{ "[", group = "Prev" },
			{ "]", group = "Next" },
			{ "[b", desc = "Prev Buffer" },
			{ "]b", desc = "Next Buffer" },
			{ "[B", desc = "Move Buffer Left" },
			{ "]B", desc = "Move Buffer Right" },
			{ "[d", desc = "Prev Diagnostic" },
			{ "]d", desc = "Next Diagnostic" },
			{ "[t", desc = "Prev TODO" },
			{ "]t", desc = "Next TODO" },
			{ "[[", desc = "Prev Reference" },
			{ "]]", desc = "Next Reference" },

			-- Fold commands (z prefix)
			{ "z", group = "Fold" },
			{ "zR", desc = "Open All Folds" },
			{ "zM", desc = "Close All Folds" },
			{ "zr", desc = "Open Folds Except Kinds" },
			{ "zm", desc = "Close Folds With" },
			{ "zK", desc = "Peek Fold" },
			{ "zp", desc = "Peek Fold" },
			{ "za", desc = "Toggle Fold" },
			{ "zo", desc = "Open Fold" },
			{ "zc", desc = "Close Fold" },

			-- Flash motions
			{ "s", desc = "Flash" },
			{ "S", desc = "Flash Treesitter" },

			-- Oil
			{ "-", desc = "Oil (Parent Directory)" },

			-- Mark motions
			{ "m", group = "Marks" },
			{ "m,", desc = "Set Next Mark" },
			{ "m;", desc = "Toggle Mark" },
			{ "m[", desc = "Prev Mark" },
			{ "m]", desc = "Next Mark" },
			{ "m:", desc = "Preview Mark" },
			{ "dm", group = "Delete Mark" },
			{ "dm-", desc = "Delete Marks on Line" },
			{ "dm<space>", desc = "Delete All Marks in Buffer" },

			-- g motions (some are LSP, set in lsp.lua)
			{ "g", group = "Goto" },

			-- Control keys
			{ "<C-\\>", desc = "Toggle Terminal" },
			{ "<C-h>", desc = "Window Left" },
			{ "<C-j>", desc = "Window Down" },
			{ "<C-k>", desc = "Window Up" },
			{ "<C-l>", desc = "Window Right" },
      { "<C-s>", desc = "Toggle Flash Search", mode = "c" },
		})
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
}
