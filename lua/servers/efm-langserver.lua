-- ================================================================================================
-- TITLE : efm-langserver
-- ABOUT : a general purpose language server protocol implemented here for linters/formatters
-- LINKS :
--   > github : https://github.com/mattn/efm-langserver
--   > configs: https://github.com/creativenull/efmls-configs-nvim/tree/main
-- ================================================================================================

--- @param capabilities table LSP client capabilities (from nvim-cmp)
--- @return nil
return function(capabilities)
	local stylua = require("efmls-configs.formatters.stylua") -- lua formatter
	local black = require("efmls-configs.formatters.black") -- python formatter
	local gofumpt = require("efmls-configs.formatters.gofumpt") -- go formatter
	local prettier_d = require("efmls-configs.formatters.prettier_d") -- ts/js/solidity/json/docker/html/css/react/svelte/vue formatter
	local eslint_d = require("efmls-configs.linters.eslint_d") -- ts/js/react/svelte/vue linter
	local fixjson = require("efmls-configs.formatters.fixjson") -- json formatter
	local shfmt = require("efmls-configs.formatters.shfmt") -- bash formatter
	local hadolint = require("efmls-configs.linters.hadolint") -- docker linter
	local cpplint = require("efmls-configs.linters.cpplint") -- c/cpp linter (clangd doesn't provide this)
	local solhint = require("efmls-configs.linters.solhint") -- solidity linter
	local csharpier = {
		formatCommand = "dotnet csharpier --write-stdout",
		formatStdin = true,
	}

	vim.lsp.config("efm", {
		capabilities = capabilities,
		filetypes = {
			"c",
			"cpp",
			"cs",
			"css",
			"dockerfile",
			"go",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"sh",
			"solidity",
			"svelte",
			"typescript",
			"typescriptreact",
			"vue",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
		},
		settings = {
			languages = {
				c = { cpplint },              -- clangd handles formatting
				cpp = { cpplint },            -- clangd handles formatting
				css = { prettier_d },
				dockerfile = { hadolint, prettier_d },
				go = { gofumpt },             -- gopls handles diagnostics
				html = { prettier_d },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				json = { fixjson },           -- jsonls handles diagnostics; eslint_d errors on plain JSON
				jsonc = { fixjson },
				lua = { stylua },             -- lua_ls handles diagnostics
				markdown = { prettier_d },
				python = { black },           -- pyright handles diagnostics
				sh = { shfmt },              -- bashls wraps shellcheck internally
				solidity = { solhint, prettier_d },
				svelte = { eslint_d, prettier_d },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				vue = { eslint_d, prettier_d },
				cs = { csharpier },
			},
		},
	})
end
