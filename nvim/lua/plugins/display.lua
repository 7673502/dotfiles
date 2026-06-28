return {
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				background = {
					light = "dawn",
					dark = "moon",
				},
			})
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{ "f-person/auto-dark-mode.nvim", opts = {} },
	{ "nvim-lualine/lualine.nvim", opts = {} },
}
