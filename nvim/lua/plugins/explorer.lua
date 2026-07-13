return {
	{
		"ibhagwan/fzf-lua",
		opts = {},
		keys = {
			{
				"<leader>ff",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live Grep",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		opts = { default_file_explorer = true },
	},
}
