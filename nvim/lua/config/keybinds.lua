-- rename symbols using F2
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Open floating diagnostic message on the current line
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- open oil using Ex
vim.api.nvim_create_user_command("Ex", "Oil", {})
