return {
  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" },
      })

      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
    end,
  },
}
