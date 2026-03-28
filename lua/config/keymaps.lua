-- ================================================================================================
-- TITLE: NeoVim keymaps
-- ABOUT: sets some quality-of-life keymaps
-- ================================================================================================

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result (Centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous Search Result (Centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half Page Down (Centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half Page Up (Centered)" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bN", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
-- Close current buffer
vim.keymap.set("n", "<leader>bd", function()
	require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })

-- Force close (ignore unsaved changes)
vim.keymap.set("n", "<leader>bD", function()
	require("mini.bufremove").delete(0, true)
end, { desc = "Delete Buffer (Force)" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split Vertical" })
vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split Horizontal" })
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +5<CR>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -5<CR>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -5<CR>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +5<CR>", { desc = "Increase Window Width" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left and Reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right and Reselect" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines (Keep Cursor)" })

-- Quick config editing
vim.keymap.set("n", "<leader>.", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit Config" })

-- DAP Keymaps (Function keys)
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debug: Continue" })
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Debug: Step Out" })

-- DAP Keymaps (Leader keys)
vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Continue/Start" })
vim.keymap.set("n", "<leader>do", function()
	require("dap").step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>dO", function()
	require("dap").step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dl", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Log Point" })
vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.open()
end, { desc = "Open REPL" })
vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "Toggle UI" })
vim.keymap.set("n", "<leader>de", function()
	require("dapui").eval()
end, { desc = "Eval Expression" })
vim.keymap.set("v", "<leader>de", function()
	require("dapui").eval()
end, { desc = "Eval Selection" })
vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>dR", function()
	require("dap").restart()
end, { desc = "Restart" })

-- Notification history (mini.notify)
vim.keymap.set("n", "<leader>nh", function()
	require("mini.notify").show_history()
end, { desc = "Notification History" })

-- Quick escape from insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Exit terminal mode
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- Quick save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- Quick quit
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Copy current file path to clipboard
vim.keymap.set("n", "<leader>yp", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("Copied: " .. path)
end, { desc = "Yank File Path" })

-- Find DLL and copy path
vim.keymap.set("n", "<leader>fL", function()
	require("fzf-lua").files({
		prompt = "DLLs> ",
		cwd = vim.fn.getcwd(),
		cmd = "find . -name '*.dll' -path '*/bin/Debug/*' | grep -v '/ref/'",
		actions = {
			["default"] = function(selected)
				local path = vim.fn.getcwd() .. "/" .. selected[1]
				vim.fn.setreg("+", path)
				print("Copied: " .. path)
			end,
		},
	})
end, { desc = "Find DLL (Copy Path)" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

-- Move lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Line Down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Line Up" })
