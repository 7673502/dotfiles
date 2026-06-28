return {
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff Open" },
			{ "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Git Diff Close" },
		},
		opts = {},
	},
}
