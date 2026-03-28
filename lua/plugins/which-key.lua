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
		triggers = {
			{ "<auto>", mode = "nxso" },
			{ "z", mode = { "n", "v" } },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		wk.add({
			-- Hidden (Harpoon slots)
			{ "<leader>1", hidden = true },
			{ "<leader>2", hidden = true },
			{ "<leader>3", hidden = true },
			{ "<leader>4", hidden = true },

			-- ===================== Leader groups =====================
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Copilot" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>n", group = "Notifications" },
			{ "<leader>o", group = "Organize" },
			{ "<leader>q", group = "Session" },
			{ "<leader>r", group = "Rename/Config" },
			{ "<leader>s", group = "Split/Search" },
			{ "<leader>t", group = "Test/Terminal" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>M", group = "Marks" },

			-- ===================== Standalone leaders =====================
			{ "<leader>-", desc = "Oil Float" },
			{ "<leader>e", desc = "Toggle File Explorer" },
			{ "<leader>m", desc = "Focus File Explorer" },
			{ "<leader>u", desc = "Toggle Undotree" },
			{ "<leader>v", desc = "Init Treesitter Selection" },
			{ "<leader>w", desc = "Save" },
			{ "<leader>z", desc = "Toggle Zen Mode" },
			{ "<leader>?", desc = "Buffer Keymaps" },

			-- ===================== Bracket motions =====================
			{ "[", group = "Prev" },
			{ "]", group = "Next" },
			{ "[b", desc = "Prev Buffer" },
			{ "]b", desc = "Next Buffer" },
			{ "[B", desc = "Move Buffer Left" },
			{ "]B", desc = "Move Buffer Right" },
			{ "[d", desc = "Prev Diagnostic" },
			{ "]d", desc = "Next Diagnostic" },
			{ "[h", desc = "Prev Hunk" },
			{ "]h", desc = "Next Hunk" },
			{ "[t", desc = "Prev TODO" },
			{ "]t", desc = "Next TODO" },
			{ "[[", desc = "Prev Reference" },
			{ "]]", desc = "Next Reference" },

			-- ===================== Shift navigation =====================
			{ "<S-h>", desc = "Prev Buffer" },
			{ "<S-l>", desc = "Next Buffer" },

			-- ===================== Fold (z prefix) =====================
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

			-- ===================== Goto (g prefix) =====================
			{ "g", group = "Goto" },
			{ "gd", desc = "Peek Definition" },
			{ "gD", desc = "Goto Definition" },
			{ "gs", desc = "Flash" },
			{ "K", desc = "Hover Documentation" },

			-- ===================== Flash =====================
			{ "S", desc = "Flash Treesitter" },

			-- ===================== Oil =====================
			{ "-", desc = "Oil (Parent Dir)" },

			-- ===================== Control keys =====================
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
