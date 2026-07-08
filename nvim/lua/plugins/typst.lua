return {
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
		keys = {
			{ "<leader>tp", "<cmd>TypstPreview<cr>", desc = "Typst Preview", ft = "typst" },
			{ "<leader>tt", "<cmd>TypstPreviewToggle<cr>", desc = "Typst Preview Toggle", ft = "typst" },
		},
	},
}
