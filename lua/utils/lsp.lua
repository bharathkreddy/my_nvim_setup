local M = {}

M.on_attach = function(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if not client then
		return
	end
	local bufnr = event.buf

	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
	end

	-- LSP navigation (Lspsaga)
	map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", "Peek Definition")
	map("n", "gD", "<cmd>Lspsaga goto_definition<CR>", "Goto Definition")
	map("n", "<leader>ls", "<cmd>vsplit | Lspsaga goto_definition<CR>", "Goto Definition (Split)")
	map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation")

	-- LSP actions (Lspsaga)
	map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code Action")
	map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename Symbol")

	-- Diagnostics (Lspsaga)
	map("n", "<leader>lD", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics")
	map("n", "<leader>ld", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics")
	map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic")
	map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic")

	-- fzf-lua keymaps
	map("n", "<leader>fd", "<cmd>FzfLua lsp_finder<CR>", "LSP Finder")
	map("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>", "References")
	map("n", "<leader>ft", "<cmd>FzfLua lsp_typedefs<CR>", "Type Definition")
	map("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", "Document Symbols")
	map("n", "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<CR>", "Workspace Symbols")
	map("n", "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", "Implementations")

	-- Order Imports (if supported by the client LSP)
	if client:supports_method("textDocument/codeAction", bufnr) then
		map("n", "<leader>oi", function()
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
			end, 50)
		end, "Organize Imports")
	end
end

return M
