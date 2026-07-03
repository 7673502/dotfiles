return {
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				dark_variant = "moon",
				styles = {
					bold = false,
					italic = false,
				},
			})
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{ "f-person/auto-dark-mode.nvim", opts = {} },
}
