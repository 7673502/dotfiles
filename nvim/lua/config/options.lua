-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make it so that underscores are not considered part of a word
vim.opt.iskeyword:remove("_")

-- Spacing
-- -- Global defaults
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- -- Language specific overrides
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})

-- Display
vim.opt.number = true
vim.o.splitright = true
