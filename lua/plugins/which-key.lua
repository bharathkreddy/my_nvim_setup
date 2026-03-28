-- ================================================================================================
-- TITLE : which-key.nvim
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
			-- =============================================
			-- Hidden keys (Harpoon quick access)
			-- =============================================
			{ "<leader>1", hidden = true },
			{ "<leader>2", hidden = true },
			{ "<leader>3", hidden = true },
			{ "<leader>4", hidden = true },

			-- =============================================
			-- Groups (Alphabetical, Single Purpose)
			-- =============================================
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Copilot" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>m", group = "Markdown" },
			{ "<leader>n", group = "Notifications" },
			{ "<leader>r", group = "Replace" },
			{ "<leader>s", group = "Split" },
			{ "<leader>t", group = "Test" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>y", group = "Yank" },
			{ "<leader>z", group = "Zen" },
			{ "<leader>M", group = "Marks" },
			{ "<leader>S", group = "Session" },
			{ "<leader>T", group = "Terminal" },

			-- =============================================
			-- Single Key Actions (Top Level)
			-- =============================================
			{ "<leader>e", desc = "Toggle File Explorer" },
			{ "<leader>E", desc = "Focus File Explorer" },
			{ "<leader>u", desc = "Undotree" },
			{ "<leader>w", desc = "Save" },
			{ "<leader>q", desc = "Quit" },
			{ "<leader>.", desc = "Edit Config" },
			{ "<leader>-", desc = "Oil Float" },
			{ "<leader>?", desc = "Buffer Keymaps" },

			-- =============================================
			-- Buffer Group
			-- =============================================
			{ "<leader>bn", desc = "Next Buffer" },
			{ "<leader>bN", desc = "Previous Buffer" },
			{ "<leader>bd", desc = "Delete Buffer" },
			{ "<leader>bD", desc = "Delete Buffer (Force)" },
			{ "<leader>bp", desc = "Pin Buffer" },
			{ "<leader>bP", desc = "Close Non-Pinned" },
			{ "<leader>bo", desc = "Close Others" },
			{ "<leader>bl", desc = "Close Left" },
			{ "<leader>br", desc = "Close Right" },

			-- =============================================
			-- Copilot Group
			-- =============================================
			{ "<leader>cc", desc = "Chat Toggle" },
			{ "<leader>ce", desc = "Explain" },
			{ "<leader>cr", desc = "Review" },
			{ "<leader>cf", desc = "Fix" },
			{ "<leader>co", desc = "Optimize" },
			{ "<leader>cd", desc = "Docs" },
			{ "<leader>cT", desc = "Tests" },
			{ "<leader>cq", desc = "Quick Chat (All Buffers)" },
			{ "<leader>cm", desc = "Switch Model" },

			-- =============================================
			-- Debug Group
			-- =============================================
			{ "<leader>dc", desc = "Continue/Start" },
			{ "<leader>do", desc = "Step Over" },
			{ "<leader>di", desc = "Step Into" },
			{ "<leader>dO", desc = "Step Out" },
			{ "<leader>db", desc = "Toggle Breakpoint" },
			{ "<leader>dB", desc = "Conditional Breakpoint" },
			{ "<leader>dl", desc = "Log Point" },
			{ "<leader>dr", desc = "Open REPL" },
			{ "<leader>du", desc = "Toggle UI" },
			{ "<leader>de", desc = "Eval Expression" },
			{ "<leader>dt", desc = "Terminate" },
			{ "<leader>dR", desc = "Restart" },

			-- =============================================
			-- Find Group (Files/Text only)
			-- =============================================
			{ "<leader>ff", desc = "Files" },
			{ "<leader>fg", desc = "Live Grep" },
			{ "<leader>fb", desc = "Buffers" },
			{ "<leader>fh", desc = "Help Tags" },
			{ "<leader>fr", desc = "Recent Files" },
			{ "<leader>fw", desc = "Grep Word" },
			{ "<leader>fW", desc = "Grep WORD" },
			{ "<leader>fd", desc = "Diagnostics (Document)" },
			{ "<leader>fD", desc = "Diagnostics (Workspace)" },
			{ "<leader>fL", desc = "Find DLL (Copy Path)" },
			{ "<leader>fT", desc = "Find TODOs" },

			-- =============================================
			-- Git Group
			-- =============================================
			{ "<leader>gg", desc = "LazyGit" },
			{ "<leader>gf", desc = "LazyGit File History" },
			{ "<leader>gv", desc = "Diff View" },
			{ "<leader>gh", desc = "File Git History" },
			{ "<leader>gH", desc = "Repo Git History" },
			{ "<leader>gs", desc = "Stage Hunk" },
			{ "<leader>gr", desc = "Reset Hunk" },
			{ "<leader>gS", desc = "Stage Buffer" },
			{ "<leader>gu", desc = "Undo Stage Hunk" },
			{ "<leader>gp", desc = "Preview Hunk" },
			{ "<leader>gb", desc = "Blame Line" },
			{ "<leader>gB", desc = "Toggle Blame" },
			{ "<leader>gd", desc = "Diff This" },

			-- =============================================
			-- Harpoon Group
			-- =============================================
			{ "<leader>ha", desc = "Add File" },
			{ "<leader>hh", desc = "Menu" },
			{ "<leader>hp", desc = "Previous" },
			{ "<leader>hn", desc = "Next" },

			-- =============================================
			-- LSP Group (All LSP operations)
			-- =============================================
			{ "<leader>lp", desc = "Peek Definition" },
			{ "<leader>ld", desc = "Go to Definition" },
			{ "<leader>lD", desc = "Definition (Split)" },
			{ "<leader>li", desc = "Implementation" },
			{ "<leader>lr", desc = "References" },
			{ "<leader>ly", desc = "Type Definition" },
			{ "<leader>la", desc = "Code Action" },
			{ "<leader>ln", desc = "Rename" },
			{ "<leader>lL", desc = "Line Diagnostics" },
			{ "<leader>lc", desc = "Cursor Diagnostics" },
			{ "<leader>l[", desc = "Prev Diagnostic" },
			{ "<leader>l]", desc = "Next Diagnostic" },
			{ "<leader>lf", desc = "LSP Finder" },
			{ "<leader>ls", desc = "Document Symbols" },
			{ "<leader>lS", desc = "Workspace Symbols" },
			{ "<leader>lo", desc = "Organize Imports" },
			{ "<leader>lO", desc = "Toggle Outline" },

			-- =============================================
			-- Markdown Group
			-- =============================================
			{ "<leader>mr", desc = "Toggle Render" },

			-- =============================================
			-- Marks Group
			-- =============================================
			{ "<leader>Ms", desc = "Set Next Mark" },
			{ "<leader>Mt", desc = "Toggle Mark" },
			{ "<leader>Md", desc = "Delete Marks on Line" },
			{ "<leader>MD", desc = "Delete All Marks" },
			{ "<leader>Mn", desc = "Next Mark" },
			{ "<leader>Mp", desc = "Prev Mark" },
			{ "<leader>Mv", desc = "Preview Mark" },
			{ "<leader>Ml", desc = "List All Marks" },
			{ "<leader>Ma", desc = "Annotate Mark" },

			-- =============================================
			-- Notifications Group
			-- =============================================
			{ "<leader>nh", desc = "Notification History" },

			-- =============================================
			-- Replace Group (Search & Replace)
			-- =============================================
			{ "<leader>rr", desc = "Search & Replace" },
			{ "<leader>rw", desc = "Replace Current Word" },
			{ "<leader>rf", desc = "Replace in File" },

			-- =============================================
			-- Split Group
			-- =============================================
			{ "<leader>sv", desc = "Split Vertical" },
			{ "<leader>sh", desc = "Split Horizontal" },

			-- =============================================
			-- Session Group
			-- =============================================
			{ "<leader>Ss", desc = "Restore Session" },
			{ "<leader>Sl", desc = "Restore Last" },
			{ "<leader>Sd", desc = "Don't Save Session" },

			-- =============================================
			-- Test Group (Neotest only)
			-- =============================================
			{ "<leader>tt", desc = "Run Nearest Test" },
			{ "<leader>tf", desc = "Run File Tests" },
			{ "<leader>ts", desc = "Toggle Summary" },
			{ "<leader>to", desc = "Test Output" },

			-- =============================================
			-- Terminal Group
			-- =============================================
			{ "<leader>Th", desc = "Horizontal" },
			{ "<leader>Tv", desc = "Vertical" },
			{ "<leader>Tf", desc = "Float" },
			{ "<leader>Ta", desc = "Toggle All" },
			{ "<leader>Tl", desc = "List Terminals" },

			-- =============================================
			-- Trouble Group
			-- =============================================
			{ "<leader>xx", desc = "Workspace Diagnostics" },
			{ "<leader>xX", desc = "Buffer Diagnostics" },
			{ "<leader>xs", desc = "Symbols" },
			{ "<leader>xl", desc = "LSP Definitions/References" },
			{ "<leader>xL", desc = "Location List" },
			{ "<leader>xQ", desc = "Quickfix List" },

			-- =============================================
			-- Yank Group
			-- =============================================
			{ "<leader>yp", desc = "Yank File Path" },

			-- =============================================
			-- Zen Group
			-- =============================================
			{ "<leader>zz", desc = "Toggle Zen Mode" },

			-- =============================================================
			-- NON-LEADER KEYBINDINGS
			-- =============================================================

			-- =============================================
			-- Bracket Motions ([/] prefix)
			-- =============================================
			{ "[", group = "Prev" },
			{ "]", group = "Next" },
			{ "[b", desc = "Prev Buffer" },
			{ "]b", desc = "Next Buffer" },
			{ "[B", desc = "Move Buffer Left" },
			{ "]B", desc = "Move Buffer Right" },
			{ "[t", desc = "Prev TODO" },
			{ "]t", desc = "Next TODO" },
			{ "]h", desc = "Next Hunk" },
			{ "[h", desc = "Prev Hunk" },

			-- =============================================
			-- Fold Commands (z prefix)
			-- =============================================
			{ "z", group = "Fold" },
			{ "zR", desc = "Open All Folds" },
			{ "zM", desc = "Close All Folds" },
			{ "zr", desc = "Open Folds Except Kinds" },
			{ "zm", desc = "Close Folds With" },
			{ "zK", desc = "Peek Fold" },
			{ "za", desc = "Toggle Fold" },
			{ "zo", desc = "Open Fold" },
			{ "zc", desc = "Close Fold" },

			-- =============================================
			-- Goto Group (g prefix)
			-- =============================================
			{ "g", group = "Goto" },
			{ "gs", desc = "Flash" },

			-- =============================================
			-- Flash Motions
			-- =============================================
			{ "S", desc = "Flash Treesitter" },
			{ "r", desc = "Remote Flash", mode = "o" },
			{ "R", desc = "Treesitter Search", mode = { "o", "x" } },

			-- =============================================
			-- Search & Navigation
			-- =============================================
			{ "n", desc = "Next Search Result (Centered)" },
			{ "N", desc = "Previous Search Result (Centered)" },
			{ "J", desc = "Join Lines (Keep Cursor)" },
			{ "-", desc = "Oil (Parent Directory)" },

			-- =============================================
			-- Visual Mode
			-- =============================================
			{ "<", desc = "Indent Left and Reselect", mode = "v" },
			{ ">", desc = "Indent Right and Reselect", mode = "v" },
			{ "J", desc = "Move Line Down", mode = "v" },
			{ "K", desc = "Move Line Up", mode = "v" },

			-- =============================================
			-- Shift Keys
			-- =============================================
			{ "<S-h>", desc = "Prev Buffer" },
			{ "<S-l>", desc = "Next Buffer" },

			-- =============================================
			-- Control Keys
			-- =============================================
			{ "<C-\\>", desc = "Toggle Terminal" },
			{ "<C-h>", desc = "Window Left" },
			{ "<C-j>", desc = "Window Down" },
			{ "<C-k>", desc = "Window Up" },
			{ "<C-l>", desc = "Window Right" },
			{ "<C-d>", desc = "Half Page Down (Centered)" },
			{ "<C-u>", desc = "Half Page Up (Centered)" },
			{ "<C-a>", desc = "Select All" },
			{ "<C-Up>", desc = "Increase Window Height" },
			{ "<C-Down>", desc = "Decrease Window Height" },
			{ "<C-Left>", desc = "Decrease Window Width" },
			{ "<C-Right>", desc = "Increase Window Width" },
			{ "<C-s>", desc = "Toggle Flash Search", mode = "c" },

			-- =============================================
			-- Insert/Terminal Mode
			-- =============================================
			{ "jk", desc = "Exit Insert Mode", mode = "i" },
			{ "jk", desc = "Exit Terminal Mode", mode = "t" },

			-- =============================================
			-- Function Keys (Debug)
			-- =============================================
			{ "<F5>", desc = "Debug: Continue" },
			{ "<F10>", desc = "Debug: Step Over" },
			{ "<F11>", desc = "Debug: Step Into" },
			{ "<F12>", desc = "Debug: Step Out" },
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
