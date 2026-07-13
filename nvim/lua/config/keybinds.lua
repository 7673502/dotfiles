-- rename symbols using F2
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Open floating diagnostic message on the current line
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- Force gd to use the lsp to go to the definition of the word under the cursor
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })

-- open oil using Ex
vim.api.nvim_create_user_command("Ex", "Oil", {})
