return {
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "mocha",
				},
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{ "f-person/auto-dark-mode.nvim", opts = {} },
	{ "nvim-lualine/lualine.nvim", opts = {} },
}
