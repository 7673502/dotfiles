-- function that checks for diagnostics before showing hover doc (binded to K)
local function smart_hover()
	local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if next(line_diagnostics) then
		vim.diagnostic.open_float({ focusable = false })
	else
		vim.lsp.buf.hover()
	end
end
vim.keymap.set("n", "K", smart_hover, { desc = "Show diagnostic or hover tooltips" })

-- rename symbols using F2
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Open floating diagnostic message on the current line
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- open oil using Ex
vim.api.nvim_create_user_command("Ex", "Oil", {})
