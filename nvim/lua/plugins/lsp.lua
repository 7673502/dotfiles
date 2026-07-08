return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"basedpyright", -- Python
			"clangd", -- C/C++
			"cssls", -- CSS
			"html", -- HTML
			"jdtls", -- Java
			"jsonls", -- JSON
			"lua_ls", -- Lua
			"marksman", -- Markdown
			"rust_analyzer", -- Rust
			"tinymist", -- Typst
			"ts_ls", -- TypeScript/JavaScript
		},
	},
}
