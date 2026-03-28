-- ================================================================================================
-- TITLE : LSP Utilities
-- ABOUT : LSP keymaps and on_attach function
-- ================================================================================================

local M = {}

M.on_attach = function(event)
	local client = vim.lsp.get_clients({ id = event.data.client_id })[1]
	if not client then
		return
	end
	local bufnr = event.buf

	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
	end

	-- LSP Navigation (idiomatic gd/gD/K)
	map("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", "Go to Definition")
	map("n", "gD", "<cmd>Lspsaga peek_definition<CR>", "Peek Definition")
	map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover Doc")

	-- Diagnostic navigation (idiomatic [d/]d)
	map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic")
	map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic")

	-- LSP Actions (<leader>l)
	map("n", "<leader>ld", function()
		vim.cmd("vsplit")
		vim.cmd("FzfLua lsp_definitions")
	end, "Definition (Split)")
	map("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", "Implementation")
	map("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", "References")
	map("n", "<leader>ly", "<cmd>FzfLua lsp_typedefs<CR>", "Type Definition")
	map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code Action")
	map("n", "<leader>ln", "<cmd>Lspsaga rename<CR>", "Rename")

	-- LSP Diagnostics (<leader>l)
	map("n", "<leader>lL", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics")
	map("n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics")

	-- LSP Find (FZF-lua)
	map("n", "<leader>lf", "<cmd>FzfLua lsp_finder<CR>", "LSP Finder")
	map("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", "Document Symbols")
	map("n", "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<CR>", "Workspace Symbols")

	-- Organize Imports
	if client:supports_method("textDocument/codeAction", bufnr) then
		map("n", "<leader>lo", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 200)
		end, "Organize Imports")
	end
end

return M
