require("config.lazy")
vim.o.background = "dark"
vim.opt.number = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- function that checks for diagnostics before showing hover doc (binded to K)
local function smart_hover()
  local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if next(line_diagnostics) then
    vim.diagnostic.open_float({ focusable = false })
  else
    vim.lsp.buf.hover()
  end
end
vim.keymap.set('n', 'K', smart_hover, { desc = "Show diagnostic or hover tooltips" })

-- rename symbols using F2
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Open floating diagnostic message on the current line
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- allow esc using "jk" pressed at once
-- vim.keymap.set('i', 'jk', '<esc>', { silent = true, noremap = true })

-- vsplit on right side
vim.o.splitright = true
