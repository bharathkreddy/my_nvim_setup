-- ================================================================================================
-- TITLE: NeoVim keymaps
-- ABOUT: sets some quality-of-life keymaps
-- ================================================================================================

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bN", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
-- Close current buffer
vim.keymap.set("n", "<leader>bd", function()
	require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })

-- Force close (ignore unsaved changes)
vim.keymap.set("n", "<leader>bD", function()
	require("mini.bufremove").delete(0, true)
end, { desc = "Delete Buffer (Force)" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", "<Cmd>e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- File Explorer
vim.keymap.set("n", "<leader>m", "<Cmd>NvimTreeFocus<CR>", { desc = "Focus on File Explorer" })
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Notification history (mini.notify)
vim.keymap.set("n", "<leader>nh", function()
	require("mini.notify").show_history()
end, { desc = "Notification History" })

-- Quick escape from insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Quick save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

-- Move lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Line Down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Line Up" })

-- DAP Keymaps
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Debug: Continue/Start" })
vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dl", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Debug: Log Point" })
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Debug: Open REPL" })
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Debug: Toggle UI" })
vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end, { desc = "Debug: Eval Expression" })
vim.keymap.set("v", "<leader>de", function() require("dapui").eval() end, { desc = "Debug: Eval Selection" })
vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Debug: Terminate" })
vim.keymap.set("n", "<leader>dR", function() require("dap").restart() end, { desc = "Debug: Restart" })
