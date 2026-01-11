-- ================================================================================================
-- TITLE : nvim-ufo
-- ABOUT : Ultra fold with modern look and LSP/Treesitter support
-- LINKS :
--   > github : https://github.com/kevinhwang91/nvim-ufo
-- ================================================================================================

return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPost",
	keys = {
		{ "zR", function() require("ufo").openAllFolds() end, desc = "Open All Folds" },
		{ "zM", function() require("ufo").closeAllFolds() end, desc = "Close All Folds" },
		{ "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Open Folds Except Kinds" },
		{ "zm", function() require("ufo").closeFoldsWith() end, desc = "Close Folds With" },
		{ "zK", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek Fold" },
		{ "zp", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek Fold" },
	},
	opts = {
		provider_selector = function(_, filetype, buftype)
			-- Use treesitter for most files, indent for others
			local ftMap = {
				vim = "indent",
				python = { "treesitter", "indent" },
				git = "",
			}
			if ftMap[filetype] then
				return ftMap[filetype]
			end
			if buftype == "nofile" then
				return ""
			end
			return { "treesitter", "indent" }
		end,
		fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d lines"):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end,
	},
	init = function()
		vim.o.foldcolumn = '1'
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
    vim.opt.fillchars:append({
		eob = " ",
		fold = " ",
		foldopen = "v",
		foldclose = ">",
		foldsep = " ",
    })
	end,
}
