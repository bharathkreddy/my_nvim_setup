-- ================================================================================================
-- TITLE : LSP Utilities
-- ABOUT : LSP keymaps and on_attach function - ALL LSP keys under <leader>l
-- ================================================================================================

local M = {}

M.on_attach = function(event)
	local client = vim.lsp.get_clients({ id = event.data.client_id })[1]
	if not client then
		return
	end
	local bufnr = event.buf
	local keymap = vim.keymap.set
	local opts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	-- =============================================
	-- LSP Navigation - All under <leader>l
	-- =============================================

	-- Peek definition (shared across all LSPs)
	keymap("n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", vim.tbl_extend("force", opts, { desc = "Peek Definition" }))

	-- Go to definition - special handling for C#
	if client.name == "omnisharp" then
		keymap("n", "<leader>ld", function()
			require("omnisharp_extended").lsp_definition()
		end, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
		keymap("n", "<leader>lD", function()
			vim.cmd("vsplit")
			require("omnisharp_extended").lsp_definition()
		end, vim.tbl_extend("force", opts, { desc = "Definition (Split)" }))
		keymap("n", "<leader>li", function()
			require("omnisharp_extended").lsp_implementation()
		end, vim.tbl_extend("force", opts, { desc = "Implementation" }))
		keymap("n", "<leader>lr", function()
			require("omnisharp_extended").lsp_references()
		end, vim.tbl_extend("force", opts, { desc = "References" }))
		keymap("n", "<leader>ly", function()
			require("omnisharp_extended").lsp_type_definition()
		end, vim.tbl_extend("force", opts, { desc = "Type Definition" }))
	else
		keymap("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<cr>", vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
		keymap("n", "<leader>lD", function()
			vim.cmd("vsplit")
			vim.cmd("FzfLua lsp_definitions")
		end, vim.tbl_extend("force", opts, { desc = "Definition (Split)" }))
		keymap("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", vim.tbl_extend("force", opts, { desc = "Implementation" }))
		keymap("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", vim.tbl_extend("force", opts, { desc = "References" }))
		keymap("n", "<leader>ly", "<cmd>FzfLua lsp_typedefs<CR>", vim.tbl_extend("force", opts, { desc = "Type Definition" }))
	end

	-- =============================================
	-- LSP Actions
	-- =============================================
	keymap("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", vim.tbl_extend("force", opts, { desc = "Code Action" }))
	keymap("n", "<leader>ln", "<cmd>Lspsaga rename<CR>", vim.tbl_extend("force", opts, { desc = "Rename" }))
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", vim.tbl_extend("force", opts, { desc = "Hover Doc" }))

	-- =============================================
	-- LSP Diagnostics
	-- =============================================
	keymap("n", "<leader>lL", "<cmd>Lspsaga show_line_diagnostics<CR>", vim.tbl_extend("force", opts, { desc = "Line Diagnostics" }))
	keymap("n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", vim.tbl_extend("force", opts, { desc = "Cursor Diagnostics" }))
	keymap("n", "<leader>l[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", vim.tbl_extend("force", opts, { desc = "Prev Diagnostic" }))
	keymap("n", "<leader>l]", "<cmd>Lspsaga diagnostic_jump_next<CR>", vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))

	-- =============================================
	-- LSP Find (FZF-lua)
	-- =============================================
	keymap("n", "<leader>lf", "<cmd>FzfLua lsp_finder<CR>", vim.tbl_extend("force", opts, { desc = "LSP Finder" }))
	keymap("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", vim.tbl_extend("force", opts, { desc = "Document Symbols" }))
	keymap("n", "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<CR>", vim.tbl_extend("force", opts, { desc = "Workspace Symbols" }))

	-- =============================================
	-- LSP Organize Imports
	-- =============================================
	if client:supports_method("textDocument/codeAction", bufnr) then
		keymap("n", "<leader>lo", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
				apply = true,
				bufnr = bufnr,
			})
			-- Format after a short delay to let the code action apply
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 200)
		end, vim.tbl_extend("force", opts, { desc = "Organize Imports" }))
	end

end

return M
